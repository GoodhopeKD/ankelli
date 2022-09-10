<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_AssetWallet;
use App\Models\_PrefItem;

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
            'description' => ['required', 'string'],
            'tr_type' => ['required', 'string'],
            'source_user_username' => ['sometimes', 'exists:__users,username', 'string'],
            'destination_user_username' => ['sometimes', 'exists:__users,username', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'transfer_value' => ['required', 'numeric'],
            'platform_charge_asset_factor' => ['sometimes', 'numeric'],
        ]);

        // Create uid
        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['session_token'] = session()->get('active_session_token', isset(request()->segments()[env('API_URL')?0:1]) ? request()->segments()[env('API_URL')?0:1] : null );
        $validated_data['action_user_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['transfer_result'] = [];

        $platform_charge_asset_factor = $validated_data['platform_charge_asset_factor'] ?? (float)_PrefItem::firstWhere('key_slug', 'platform_charge_asset_factor')->value;
        $validated_data['platform_charge_asset_value'] = (!isset($validated_data['source_user_username']) || $validated_data['source_user_username'] == 'reserves' || $validated_data['source_user_username'] == 'escrow' || $validated_data['destination_user_username'] == 'reserves' || $validated_data['destination_user_username'] == 'escrow') ? 0 : $validated_data['transfer_value'] * $platform_charge_asset_factor;

        $saving_platform_charge_as_transaction = true;

        if (isset($validated_data['source_user_username'])){
            if ( isset($validated_data['destination_user_username']) && $validated_data['source_user_username'] == $validated_data['destination_user_username']){
                return abort(422, 'Cannot transact to self.');
            }
            $source_user_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $validated_data['source_user_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);

            if ( $source_user_asset_wallet->_status == 'frozen' ){ return abort(422, 'Selected asset is frozen.'); }
            if ( !$source_user_asset_wallet ){ return abort(422, 'Current ' . $validated_data['asset_code'] . ' balance insufficient for transaction.'); }
            
            $old_asset_value = $source_user_asset_wallet->asset_value;
            $new_asset_value = $old_asset_value - $validated_data['transfer_value'];

            if ( $new_asset_value < 0 ){ return abort(422, 'Current ' . $validated_data['asset_code'] . ' balance for ' . $validated_data['source_user_username'] . ' insufficient for transaction.'); }

            if ( $validated_data['platform_charge_asset_value'] && !$saving_platform_charge_as_transaction ){
                $ankelli_reserves_asset_wallet = _AssetWallet::firstOrCreate([
                    'user_username' => 'reserves', 
                    'asset_code' => $validated_data['asset_code']
                ]);
                array_push( $validated_data['transfer_result'], [
                    'user_username' => 'reserves',
                    'old_asset_value' => $ankelli_reserves_asset_wallet->asset_value,
                    'new_asset_value' => $ankelli_reserves_asset_wallet->asset_value + $validated_data['platform_charge_asset_value'],
                ]);
                (new _AssetWalletController)->update( new Request([
                    'asset_value' => $ankelli_reserves_asset_wallet->asset_value + $validated_data['platform_charge_asset_value'],
                ]), $ankelli_reserves_asset_wallet->id );
            }

            array_push( $validated_data['transfer_result'], [
                'user_username' => $validated_data['source_user_username'],
                'old_asset_value' => $old_asset_value,
                'new_asset_value' => $new_asset_value,
            ]);

            (new _AssetWalletController)->update( new Request([
                'asset_value' => $new_asset_value
            ]), $source_user_asset_wallet->id );
        }

        if (isset($validated_data['destination_user_username'])){
            //$destination_user = _User::where('username', $validated_data['destination_user_username']);
            $destination_user_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $validated_data['destination_user_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);
            if (!$destination_user_asset_wallet){
                $destination_user_asset_wallet = (new _AssetWalletController)->store( new Request([
                    'user_username' => $validated_data['destination_user_username'], 
                    'asset_code' => $validated_data['asset_code']
                ]))->getData();
            }

            $old_asset_value = $destination_user_asset_wallet->asset_value;
            $new_asset_value = $old_asset_value + $validated_data['transfer_value'];

            array_push( $validated_data['transfer_result'], [
                'user_username' => $validated_data['destination_user_username'],
                'old_asset_value' => $old_asset_value,
                'new_asset_value' => $new_asset_value,
            ]);

            (new _AssetWalletController)->update( new Request([
                'asset_value' => $new_asset_value
            ]), $destination_user_asset_wallet->id );
        }

        $element = _Transaction::create($validated_data);

        if ( isset($validated_data['source_user_username']) && $validated_data['platform_charge_asset_value'] && $saving_platform_charge_as_transaction ){
            sleep(1);
            (new _TransactionController)->store( new Request([
                'description' => 'Platform charge for transaction "' . $element->ref_code . '"',
                'tr_type' => 'platform_charge',
                'source_user_username' => $validated_data['source_user_username'],
                'destination_user_username' => 'reserves',
                'asset_code' => $validated_data['asset_code'],
                'transfer_value' => $validated_data['platform_charge_asset_value'],
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
        if ( in_array( $element->tr_type, ['escrow_asset_lock', 'escrow_asset_unlock'] )){
            $element->delete();
            return response()->json(['success' => 'success'], 200);
        } else {
            return abort(422, 'Transaction cannot be deleted');
        }
    }
}
