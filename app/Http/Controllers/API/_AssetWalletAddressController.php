<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_PrefItem;
use App\Models\_AssetCustodialWalletAddress;
use App\Models\_AssetWallet;

use App\Models\_AssetWalletAddress;
use App\Http\Resources\_AssetWalletAddressResource;
use App\Http\Resources\_AssetWalletAddressResourceCollection;

class _AssetWalletAddressController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $result = null;
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->asset_wallet_id ){ $simple_query_args = array_merge( $simple_query_args, [ 'asset_wallet_id' => request()->asset_wallet_id ]); }

            $eloquent_query = _AssetWalletAddress::where($simple_query_args);
            
            $result = $eloquent_query->orderByDesc('created_datetime')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? _AssetWalletAddressResource::collection( $result ) : null;
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
            'asset_wallet_id' => ['required', 'integer', 'exists:__asset_wallets,id'],
            'user_username' => ['required', 'string', 'exists:__users,username'],
            'blockchain_address' => ['sometimes', 'string'],
            'ttm_derivation_key' => ['sometimes', 'integer'],
        ]);

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() && !isset($validated_data['blockchain_address']) ){
            $asset_wallet = _AssetWallet::find($validated_data['asset_wallet_id'])->makeVisible(['ttm_virtual_account_id']);
            if ( false ){
                $ttm_element = (new Tatum\VirtualAccounts\BCAddressController)->generateDepositAddress(new Request(['id' => $asset_wallet->ttm_virtual_account_id]))->getData();
                $validated_data['ttm_derivation_key'] = $ttm_element->derivationKey;
                $validated_data['blockchain_address'] = strtolower( $ttm_element->address );
            } else {
                $address_saved = false;
                while ($address_saved == false) {
                    $asset_custodial_wallet_address = _AssetCustodialWalletAddress::firstWhere(['asset_chain' => $asset_wallet->asset_chain])->makeVisible(['ttm_activated_unused_gp_addresses']);
                    if (!count($asset_custodial_wallet_address->ttm_activated_unused_gp_addresses)){
                        (new _AssetCustodialWalletAddressController)->activate_next_batch(new Request(), $asset_custodial_wallet_address->id);
                        $asset_custodial_wallet_address = _AssetCustodialWalletAddress::firstWhere(['asset_chain' => $asset_wallet->asset_chain])->makeVisible(['ttm_activated_unused_gp_addresses']);
                    }
                    $ttm_activated_unused_gp_addresses = $asset_custodial_wallet_address->ttm_activated_unused_gp_addresses;
                    $chosen_gp_address = array_shift($ttm_activated_unused_gp_addresses);
                    (new _AssetCustodialWalletAddressController)->update(new Request(['ttm_activated_unused_gp_addresses' => $ttm_activated_unused_gp_addresses]), $asset_custodial_wallet_address->id);
                    $address_usable = true;
                    try {
                        if ((new Tatum\VirtualAccounts\BCAddressController)->addressExists(new Request(['address' => strtolower( $chosen_gp_address ), 'currency' => $asset_wallet->asset_code]))->getData()){ $address_usable = false; }
                    } catch (\Throwable $th) {
                        $message = $th->getMessage();
                        if (str_contains($message, 'The combination of address')){ $address_usable = true; }
                        if (str_contains($message, 'Unable to find sender account')){ $address_usable = false; }
                    }
                    if ( $address_usable ){
                        $ttm_element = (new Tatum\VirtualAccounts\BCAddressController)->assignAddress(new Request(['id' => $asset_wallet->ttm_virtual_account_id, 'address' => strtolower( $chosen_gp_address )]))->getData();
                        $validated_data['blockchain_address'] = strtolower( $ttm_element->address );
                        $address_saved = true;
                    }
                }
            }
        }

        $element = _AssetWalletAddress::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _AssetWalletAddress entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _AssetWalletAddressResource( $element ) );
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
