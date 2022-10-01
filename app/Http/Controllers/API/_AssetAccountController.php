<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_PrefItem;
use App\Models\_User;
use App\Models\_AssetAccountAddress;

use App\Models\_AssetAccount;
use App\Http\Resources\_AssetAccountResource;
use App\Http\Resources\_AssetAccountResourceCollection;

class _AssetAccountController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function get_customers()
    {
        return (new __TatumAPIController)->getCustomers(new Request())->getData();
    }

    public function get_accounts()
    {
        return (new __TatumAPIController)->getVirtualAccounts(new Request())->getData();
    }

    public function get_addresses()
    {
        return (new __TatumAPIController)->getVirtualAccountDepositAddresses(new Request(['virtual_account_id' => '63296ef838931796fa9e5aed']))->getData();
    }

    public function get_transactions()
    {
        return (new __TatumAPIController)->getVirtualAccountTransactions(new Request(['virtual_account_id' => '63296ef838931796fa9e5aed', 'currency' => 'ETH']))->getData();
    }

    public function get_subscriptions()
    {
        return (new __TatumAPIController)->getActiveNotifWebhookSubscns(new Request())->getData();
    }

    public function get_subscription_notifications()
    {
        return (new __TatumAPIController)->getWebhookSubscnNotifs(new Request())->getData();
    }

    public function redo_tatum_txrecon_transactions()
    {
        foreach ( array_reverse((new __TatumAPIController)->getAllTransactions(new Request())->getData()) as $transaction) {
            (new _TransactionController)->tatum_txrecon(new Request( json_decode(json_encode($transaction), true) ));
            sleep(1);
        }
    }

    public function redo_tatum_subscription_webhook_txrecon_requests()
    {
        foreach ( array_reverse((new __TatumAPIController)->getWebhookSubscnNotifs(new Request())->getData()) as $request) {
            if (!isset($request->retryCount)){
                (new _TransactionController)->tatum_subscription_webhook_txrecon(new Request( json_decode(json_encode($request->data), true) ));
                sleep(1);
            }
        }
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
            'user_username' => ['required', 'string', 'exists:__users,username'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'frozen'])],
        ]);

        if (_AssetAccount::where(['user_username' => $validated_data['user_username'], 'asset_code' => $validated_data['asset_code']])->exists()){
            return abort(422, 'Account with given params already exists');
        }

        $validated_data['usable_balance_asset_value'] = 0;
        $validated_data['total_balance_asset_value'] = 0;

        if ( _PrefItem::firstWhere('key_slug', 'use_tatum_api')->value_f() ){
            $tatum_element = null;
            try {
                $tatum_elements = (new __TatumAPIController)->getVirtualAccounts(new Request(['externalId' => $validated_data['user_username'], 'asset_code' => $validated_data['asset_code']]))->getData();
                if (count($tatum_elements)){ $tatum_element = $tatum_elements[0]; }
            } catch (\Throwable $th) {}
            $tatum_element = $tatum_element ?? (new __TatumAPIController)->createVirtualAccountXpub(new Request(['user_username' => $validated_data['user_username'], 'asset_code' => $validated_data['asset_code']]))->getData();

            $validated_data['tatum_virtual_account_id'] = $tatum_element->id;
            //$validated_data['usable_balance_asset_value'] = $tatum_element->balance->availableBalance;
            //$validated_data['total_balance_asset_value'] = $tatum_element->balance->accountBalance;
            $user = _User::firstWhere('username', $validated_data['user_username']);
            if (!$user->tatum_customer_id){
                (new _UserController)->update(new Request(['tatum_customer_id' => $tatum_element->customerId]), $validated_data['user_username']);
            }

            $tatum_element = null;
            try {
                $tatum_element = (new __TatumAPIController)->createIncomingVirtualAcctTxnNotifWebhookSubscn(new Request(['virtual_account_id' => $validated_data['tatum_virtual_account_id']]))->getData();
            } catch (\Throwable $th) {
                $tatum_elements = (new __TatumAPIController)->getActiveNotifWebhookSubscns(new Request())->getData();
                foreach ($tatum_elements as $item) {
                    if ($item->attr->id == $validated_data['tatum_virtual_account_id']){ $tatum_element = $item; break; }
                }
            }
            $validated_data['tatum_subscription_id'] = $tatum_element->id;
        }

        $element = _AssetAccount::create($validated_data);

        if ( _PrefItem::firstWhere('key_slug', 'use_tatum_api')->value_f() ){
            $asset_account_addresses = (new __TatumAPIController)->getVirtualAccountDepositAddresses(new Request(['virtual_account_id' => $validated_data['tatum_virtual_account_id']]))->getData();
            if (count($asset_account_addresses)){
                foreach ($asset_account_addresses as $asset_account_address) {
                    $asset_account_address_params = [
                        'asset_account_id' => $element->id, 
                        'user_username' => $validated_data['user_username'],
                        'blockchain_address' => $asset_account_address->address,
                        'tatum_derivation_key' => $asset_account_address->derivationKey,
                    ];
                    if ( !_AssetAccountAddress::where($asset_account_address_params)->exists() ){
                        (new _AssetAccountAddressController)->store(new Request($asset_account_address_params));
                    }
                }
            } else {
                (new _AssetAccountAddressController)->store(new Request(['asset_account_id' => $element->id, 'user_username' => $validated_data['user_username']]));
            }
        }
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _AssetAccount entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _AssetAccountResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $element = _AssetAccount::findOrFail($id);
        return response()->json( new _AssetAccountResource( $element ) );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function blockAssetValue(Request $request, int $id)
    {
        $validated_data = $request->validate([
            'asset_value' => ['required', 'numeric'],
        ]);
        $element = _AssetAccount::findOrFail($id);
        return (new _AssetAccountController)->update( new Request([
            'action_note' => 'Block an asset value',
            'usable_balance_asset_value' => $element->usable_balance_asset_value - $validated_data['asset_value'],
        ]), $id );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function unblockAssetValue(Request $request, int $id)
    {
        $validated_data = $request->validate([
            'asset_value' => ['required', 'numeric'],
        ]);
        $element = _AssetAccount::findOrFail($id);
        return (new _AssetAccountController)->update( new Request([
            'action_note' => 'Unblock an asset value',
            'usable_balance_asset_value' => $element->usable_balance_asset_value + $validated_data['asset_value'],
        ]), $id );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, int $id)
    {
        $validated_data = $request->validate([
            'usable_balance_asset_value' => ['sometimes', 'numeric'],
            'total_balance_asset_value' => ['sometimes', 'numeric'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'frozen'])],
        ]);

        $element = _AssetAccount::findOrFail($id);

        // Handle _Log
        $log_entry_update_result = [];
        foreach ( $validated_data as $key => $value ) {
            if ( in_array( $key, $element->getFillable() ) && $element->{$key} != $value ){
                array_push( $log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        (new _LogController)->store( new Request([
            'action_note' => 'Updating of _AssetAccount entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _AssetAccountResource( $element ) );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        //
    }
}
