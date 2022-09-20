<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

use App\Models\_AssetAccount;
use App\Models\_PrefItem;
use App\Models\_User;

use App\Models\_Transaction;
use App\Http\Resources\_TransactionResource;
use App\Http\Resources\_TransactionResourceCollection;

class _TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $result = null;

        if ( $result === null && request()->get_as_addon_prop && request()->get_as_addon_prop == true ){
            $result = _Transaction::where(['_status'=>'active'])
            ->orderByDesc('transfer_datetime')->paginate(request()->per_page)->withQueryString(); 
        }
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->source_user_username ){ $simple_query_args = array_merge( $simple_query_args, [ 'source_user_username' => request()->source_user_username ]); }
            if ( request()->destination_user_username ){ $simple_query_args = array_merge( $simple_query_args, [ 'destination_user_username' => request()->destination_user_username ]); }

            $eloquent_query = _Transaction::where($simple_query_args);

            if ( request()->user_username && is_string( request()->user_username ) ){
                $eloquent_query = $eloquent_query
                ->where(['source_user_username' => request()->user_username ])
                ->orWhere(function($query) { $query->where(['destination_user_username' => request()->user_username ]); });
            }
            
            $result = $eloquent_query->orderByDesc('transfer_datetime')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _TransactionResource::collection( $result ) : new _TransactionResourceCollection( $result ) ) : null;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated_data = $request->validate([
            'context' => ['required', 'string', Rule::in(['onchain', 'offchain'])],
            'description' => ['required', 'string'],
            'operation_slug' => ['required', 'string'],
            'source_user_username' => ['sometimes', 'exists:__users,username', 'string'],
            'source_user_password' => ['sometimes', 'string', 'min:8', 'max:32'],
            'destination_user_username' => ['sometimes', 'exists:__users,username', 'string'],
            'destination_blockchain_address' => ['sometimes', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'transfer_asset_value' => ['required', 'numeric'],
            'platform_charge_asset_factor' => ['sometimes', 'numeric'],
            'is_recon' => ['sometimes', 'boolean'],
            'blockchain_txid' => ['required_if:is_recon,==,true', 'string'],
            'transfer_datetime' => ['required_if:is_recon,==,true', 'date:Y-m-d H:i:s'],
        ]);

        if (isset($validated_data['source_user_username']) && !in_array($validated_data['source_user_username'], ['reserves']) ){
            if (isset($validated_data['source_user_password'])){
                if (!Hash::check($validated_data['source_user_password'], _User::firstWhere('username', session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null ))->makeVisible(['password'])->password)) {
                    return abort(422, 'Password incorrect');
                }
            } else {
                return abort(403, 'Source user password required to authorize transaction');
            }
        }

        $source_user_new_total = 0;
        $source_user_new_usable = 0;
        $destination_user_new_total = 0;
        $destination_user_new_usable = 0;

        // Create uid
        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['session_token'] = session()->get('active_session_token', isset(request()->segments()[env('API_URL')?0:1]) ? request()->segments()[env('API_URL')?0:1] : null );
        $validated_data['action_user_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['transfer_result'] = [];

        $platform_charge_asset_factor = $validated_data['platform_charge_asset_factor'] ?? (float)_PrefItem::firstWhere('key_slug', 'platform_charge_asset_factor')->value;
        $validated_data['platform_charge_asset_value'] = (!isset($validated_data['source_user_username']) || in_array($validated_data['destination_user_username'], ['reserves']) || in_array($validated_data['source_user_username'], ['reserves']) ) ? 0 : $validated_data['transfer_asset_value'] * $platform_charge_asset_factor;

        if (isset($validated_data['source_user_username'])){
            if ( isset($validated_data['destination_user_username']) && $validated_data['source_user_username'] == $validated_data['destination_user_username']){
                return abort(422, 'Cannot transact to self.');
            }
            $source_user_asset_account = _AssetAccount::firstWhere([
                'user_username' => $validated_data['source_user_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);

            if ( $source_user_asset_account->_status == 'frozen' ){ return abort(422, 'Selected asset is frozen.'); }
            if ( !$source_user_asset_account ){ return abort(422, 'Current ' . $validated_data['asset_code'] . ' balance insufficient for transaction.'); }
            
            $old_usable_balance_asset_value = $source_user_asset_account->usable_balance_asset_value;
            $new_usable_balance_asset_value = $old_usable_balance_asset_value - $validated_data['transfer_asset_value'];

            if ( $new_usable_balance_asset_value < 0 ){ return abort(422, 'Current ' . $validated_data['asset_code'] . ' balance for ' . $validated_data['source_user_username'] . ' insufficient for transaction.'); }

            $old_total_balance_asset_value = $source_user_asset_account->total_balance_asset_value;
            $new_total_balance_asset_value = $old_total_balance_asset_value - $validated_data['transfer_asset_value'];

            array_push( $validated_data['transfer_result'], [
                'user_username' => $validated_data['source_user_username'],
                'old_usable_balance_asset_value' => $old_usable_balance_asset_value,
                'new_usable_balance_asset_value' => $new_usable_balance_asset_value,
                'old_total_balance_asset_value' => $old_total_balance_asset_value,
                'new_total_balance_asset_value' => $new_total_balance_asset_value,
            ]);

            $source_user_new_total = $new_total_balance_asset_value;
            $source_user_new_usable = $new_usable_balance_asset_value;

            (new _AssetAccountController)->update( new Request([
                'usable_balance_asset_value' => $new_usable_balance_asset_value,
                'total_balance_asset_value' => $new_total_balance_asset_value,
            ]), $source_user_asset_account->id );
        }

        if (isset($validated_data['destination_user_username'])){
            //$destination_user = _User::where('username', $validated_data['destination_user_username']);
            $destination_user_asset_account = _AssetAccount::firstWhere([
                'user_username' => $validated_data['destination_user_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);
            if (!$destination_user_asset_account){
                $destination_user_asset_account = (new _AssetAccountController)->store( new Request([
                    'user_username' => $validated_data['destination_user_username'], 
                    'asset_code' => $validated_data['asset_code']
                ]))->getData();
            }

            $old_usable_balance_asset_value = $destination_user_asset_account->usable_balance_asset_value;
            $new_usable_balance_asset_value = $old_usable_balance_asset_value + $validated_data['transfer_asset_value'];

            $old_total_balance_asset_value = $destination_user_asset_account->total_balance_asset_value;
            $new_total_balance_asset_value = $old_total_balance_asset_value + $validated_data['transfer_asset_value'];

            array_push( $validated_data['transfer_result'], [
                'user_username' => $validated_data['destination_user_username'],
                'old_usable_balance_asset_value' => $old_usable_balance_asset_value,
                'new_usable_balance_asset_value' => $new_usable_balance_asset_value,
                'old_total_balance_asset_value' => $old_total_balance_asset_value,
                'new_total_balance_asset_value' => $new_total_balance_asset_value,
            ]);

            $destination_user_new_total = $new_total_balance_asset_value;
            $destination_user_new_usable = $new_usable_balance_asset_value;

            (new _AssetAccountController)->update( new Request([
                'usable_balance_asset_value' => $new_usable_balance_asset_value,
                'total_balance_asset_value' => $new_total_balance_asset_value,
            ]), $destination_user_asset_account->id );
        }

        if ( _PrefItem::firstWhere('key_slug', 'use_tatum_crypto_asset_engine')->value_f() ){
            $tatum_request_object = [
                'asset_code' => $validated_data['asset_code'],
                'senderAccountId' => isset($source_user_asset_account) ? $source_user_asset_account->tatum_virtual_account_id : null,
                'recipientAccountId' => isset($destination_user_asset_account) ? $destination_user_asset_account->tatum_virtual_account_id : null,
                'amount' => $validated_data['transfer_asset_value'] + '',
            ];
            if ($validated_data['context'] == 'onchain') {
                if ($tatum_request_object['senderAccountId']){
                    $tatum_request_object['index'] = $source_user_asset_account->tatum_derivation_key;
                    $tatum_request_object['address'] = $validated_data['destination_blockchain_address'];
                    $tatum_element = (new __TatumAPIController)->transferAssetValueFromVirtualAccountToBlockchain(new Request($tatum_request_object))->getData();
                    $validated_data['blockchain_txid'] = $tatum_element->txId;
                }
            } else {
                $tatum_element = (new __TatumAPIController)->transferAssetValueOffchain(new Request($tatum_request_object))->getData();
                $validated_data['tatum_reference'] = $tatum_element->reference;
            }
        }
        $element = _Transaction::create($validated_data);

        if ( isset($validated_data['source_user_username']) && !in_array($validated_data['source_user_username'], ['reserves']) ){
            // Create notification
            (new _NotificationController)->store( new Request([
                'user_username' => $validated_data['source_user_username'],
                'content' => [
                    'title' => 'Debit Transaction',
                    'subtitle' => $validated_data['transfer_asset_value'].' '.$validated_data['asset_code'].' has been debited from your account.',
                    'body' => $validated_data['transfer_asset_value']." ".$validated_data["asset_code"]." has been debited from your account.\nTxn ref: ".$element->ref_code.".\nDescription: ".$validated_data["description"]."\nNew balances: Usable : ".$source_user_new_usable ." ".$validated_data["asset_code"].", Total : ".$source_user_new_total ." ".$validated_data["asset_code"],
                ],
            ]));
            // End Create notification
        }

        if ( isset($validated_data['destination_user_username']) && !in_array($validated_data['destination_user_username'], ['reserves']) ){
            // Create notification
            (new _NotificationController)->store( new Request([
                'user_username' => $validated_data['destination_user_username'],
                'content' => [
                    'title' => 'Credit Transaction',
                    'subtitle' => $validated_data['transfer_asset_value'].' '.$validated_data['asset_code'].' has been credited into your account.',
                    'body' => $validated_data['transfer_asset_value']." ".$validated_data["asset_code"]." has been credited into your account.\nTxn ref: ".$element->ref_code.".\nDescription: ".$validated_data["description"]."\nNew balances: Usable : ".$destination_user_new_usable ." ".$validated_data["asset_code"].", Total : ".$destination_user_new_total ." ".$validated_data["asset_code"],
                ],
            ]));
            // End Create notification
        }

        if ( isset($validated_data['source_user_username']) && $validated_data['platform_charge_asset_value'] ){
            sleep(1);
            (new _TransactionController)->store( new Request([
                'context' => 'offchain',
                'description' => 'Platform charge for transaction ' . $element->ref_code,
                'operation_slug' => 'platform_charge',
                'source_user_username' => $validated_data['source_user_username'],
                'source_user_password' => $validated_data['source_user_password'],
                'destination_user_username' => 'reserves',
                'asset_code' => $validated_data['asset_code'],
                'transfer_asset_value' => $validated_data['platform_charge_asset_value'],
            ]));
        }

        return response()->json( new _TransactionResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function show(string $ref_code)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $ref_code)
    {
        $element = _Transaction::findOrFail($ref_code);
        if ( in_array( $element->operation_slug, ['escrow_asset_lock', 'escrow_asset_unlock'] )){
            $element->delete();
            return response()->json(['success' => 'success'], 200);
        } else {
            return abort(422, 'Transaction cannot be deleted');
        }
    }
}
