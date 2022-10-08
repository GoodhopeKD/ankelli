<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_Asset;
use App\Models\_PrefItem;

use App\Models\_AssetCustodialWalletAddress;
use App\Http\Resources\_AssetCustodialWalletAddressResource;
use App\Http\Resources\_AssetCustodialWalletAddressResourceCollection;

class _AssetCustodialWalletAddressController extends Controller
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'chain' => ['required', 'string', 'exists:__assets,chain'],
            'blockchain_address' => ['nullable', 'string', 'between:13,128', 'unique:__asset_custodial_wallet_addresses,blockchain_address'],
            'ttm_wallet_id' => ['required_with:blockchain_address', 'string'],

            'ttm_gp_address' => ['nullable', 'string', 'between:13,128', 'unique:__asset_custodial_wallet_addresses,ttm_gp_address'],
            'ttm_gp_index_from' => ['required_with:ttm_gp_address', 'integer', 'min:0'],
            'ttm_gp_index_to' => ['required_with:ttm_gp_address', 'integer', 'min:0'],
            //'ttm_gp_trx_fee_limit' => ['required_with:ttm_gp_address', 'integer', 'min:0'],
            'ttm_gp_actvxn_txn_id' => ['required_with:ttm_gp_address', 'string', 'unique:__asset_custodial_wallet_addresses,ttm_gp_actvxn_txn_id'],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){

            if (!isset($validated_data['blockchain_address'])){
                $ttm_element = (new Tatum\Security\CustodialManagedWalletController)->CustodialCreateWallet(new Request(['chain' => $validated_data['chain']]))->getData();
                $validated_data['blockchain_address'] = $ttm_element->address;
                $validated_data['ttm_wallet_id'] = $ttm_element->walletId;
            }

            // Notification subscription
            $ttm_element = null;
            try {
                $ttm_element = (new Tatum\Subscriptions\NotificationSubscriptionController)->createSubscription(new Request([
                    'type' => 'ADDRESS_TRANSACTION',
                    'attr' => [
                        'address' => $validated_data['blockchain_address'],
                        'chain' => $validated_data['chain'],
                        'url' => "https://api.ankelli.com/webhooks/tatum/nofitications",
                    ],
                ]))->getData();
            } catch (\Throwable $th) {
                $ttm_elements = (new Tatum\Subscriptions\NotificationSubscriptionController)->getSubscriptions(new Request())->getData();
                foreach ($ttm_elements as $item) {
                    if ($item->attr->address == $validated_data['blockchain_address']){ $ttm_element = $item; break; }
                }
            }
            $validated_data['ttm_subscription_id'] = $ttm_element->id;

            // Gas pump
            if (!isset($validated_data['ttm_gp_address'])){
                /*$validated_data['ttm_gp_index_from'] = (_AssetCustodialWalletAddress::max('ttm_gp_index_to') ?? -1) + 1;
                $validated_data['ttm_gp_index_to'] = $validated_data['ttm_gp_index_from'] + 270;
                $ttm_element = (new Tatum\SmartContracts\GasPumpController)->PrecalculateGasPumpAddresses(new Request([
                    'chain' => $validated_data['chain'],
                    'owner' => $validated_data['blockchain_address'],
                    'from' => $validated_data['ttm_gp_index_from'],
                    'to' => $validated_data['ttm_gp_index_to'],
                ]))->getData();
                $validated_data['ttm_gp_address'] = $ttm_element[0];

                $ttm_element = (new Tatum\SmartContracts\GasPumpController)->ActivateGasPumpAddresses(new Request([
                    'chain' => $validated_data['chain'],
                    'owner' => $validated_data['blockchain_address'],
                    'from' => $validated_data['ttm_gp_index_from'],
                    'to' => $validated_data['ttm_gp_index_to'],
                ]))->getData();
                $validated_data['ttm_gp_actvxn_txn_id'] = $ttm_element->txId;*/
            }

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
        //
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
