<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_PrefItem;

use App\Models\_AssetCustodialWalletAddress;
use App\Http\Resources\_AssetCustodialWalletAddressResource;
use App\Http\Resources\_AssetCustodialWalletAddressResourceCollection;

class _AssetCustodialWalletAddressController extends Controller
{
    private $ACTIVATION_BATCH_SIZE = 16;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            'asset_chain' => ['required', 'string', 'exists:__assets,chain'],
            'blockchain_address' => ['nullable', 'string', 'between:13,128', 'unique:__asset_custodial_wallet_addresses,blockchain_address'],
            'ttm_wallet_id' => ['required_with:blockchain_address', 'string'],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){

            if (!isset($validated_data['blockchain_address'])){
                $ttm_element = (new Tatum\Security\CustodialManagedWalletController)->CustodialCreateWallet(new Request(['chain' => $validated_data['asset_chain']]))->getData();
                $validated_data['blockchain_address'] = strtolower( $ttm_element->address );
                $validated_data['ttm_wallet_id'] = $ttm_element->walletId;
            }

            // Notification subscription
            $ttm_element = (new Tatum\Subscriptions\NotificationSubscriptionController)->createSubscription(new Request([
                'type' => 'ADDRESS_TRANSACTION',
                'attr' => [
                    'address' => strtolower( $validated_data['blockchain_address'] ),
                    'chain' => $validated_data['asset_chain'],
                    'url' => "https://api.ankelli.com/webhooks/tatum/nofitications/address-transaction",
                ],
            ]))->getData();
            $validated_data['ttm_subscription_id'] = $ttm_element->id;

            // Generate gas pump addresses
            $ttm_activated_unused_gp_addresses_offset_index = 15; //-1; // existing
            $from = $ttm_activated_unused_gp_addresses_offset_index + 1;
            $to = $from + $this->ACTIVATION_BATCH_SIZE - 1; // - 1 because it's inclusive
            $validated_data['ttm_activated_unused_gp_addresses_offset_index'] = $to;
            $ttm_element = (new Tatum\SmartContracts\GasPumpController)->PrecalculateGasPumpAddresses(new Request([
                'chain' => $validated_data['asset_chain'],
                'owner' => strtolower( $validated_data['blockchain_address'] ),
                'from' => $from,
                'to' => $to,
            ]))->getData();
            $validated_data['ttm_activated_unused_gp_addresses'] = $ttm_element;

            /* First 16 already activated
            // Activate gas pump addresses
            $ttm_element = (new Tatum\SmartContracts\GasPumpController)->ActivateGasPumpAddresses(new Request([
                'chain' => $validated_data['asset_chain'],
                'owner' => strtolower( $validated_data['blockchain_address'] ),
                'from' => $from,
                'to' => $to,
            ]))->getData();
            $validated_data['ttm_last_gp_addresses_activation_txn_signature_id'] = $ttm_element->signatureId;*/
        }
        
        $element = _AssetCustodialWalletAddress::create($validated_data);
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _AssetCustodialWalletAddress entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling

        if ($request->expectsJson()) return response()->json( new _AssetCustodialWalletAddressResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validated_data = $request->validate([
            'ttm_activated_unused_gp_addresses' => ['sometimes', 'array'],
            'ttm_last_gp_addresses_activation_txn_signature_id' => ['sometimes', 'string'],
        ]);

        $element = _AssetCustodialWalletAddress::findOrFail($id);

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
        if (!count($log_entry_update_result)) return abort(422, 'No values were updated');
        (new _LogController)->store( new Request([
            'action_note' => 'Updating of _AssetCustodialWalletAddress entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _AssetCustodialWalletAddressResource( $element ) );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function activate_next_batch(Request $request, $id)
    {
        $validated_data = [];

        $element = _AssetCustodialWalletAddress::findOrFail($id);
        
        $from = $element->ttm_activated_unused_gp_addresses_offset_index + 1;
        $to = $from + $this->ACTIVATION_BATCH_SIZE - 1; // - 1 because it's inclusive
        $validated_data['ttm_activated_unused_gp_addresses_offset_index'] = $to;
        $ttm_element = (new Tatum\SmartContracts\GasPumpController)->PrecalculateGasPumpAddresses(new Request([
            'chain' => $element->asset_chain,
            'owner' => strtolower( $element->blockchain_address ),
            'from' => $from,
            'to' => $to,
        ]))->getData();
        $validated_data['ttm_activated_unused_gp_addresses'] = $ttm_element;

        $ttm_element = (new Tatum\SmartContracts\GasPumpController)->ActivateGasPumpAddresses(new Request([
            'chain' => $element->asset_chain,
            'owner' => strtolower( $element->blockchain_address ),
            'from' => $from,
            'to' => $to,
        ]))->getData();
        $validated_data['ttm_last_gp_addresses_activation_txn_signature_id'] = $ttm_element->signatureId;

        $element->update($validated_data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
