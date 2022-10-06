<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_PrefItem;
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
            'tatum_derivation_key' => ['sometimes', 'integer'],
        ]);

        if ( !isset($validated_data['blockchain_address']) ){
            if ( _PrefItem::firstWhere('key_slug', 'use_tatum_api')->value_f() ){
                $asset_wallet = _AssetWallet::find($validated_data['asset_wallet_id'])->makeVisible(['tatum_virtual_account_id']);
                if ( $validated_data['user_username'] === 'hot-wallets-user' ){
                    $tatum_element = (new __TatumAPIController)->getBlockchainWalletAddress(new Request(['asset_code' => $asset_wallet->asset_code, 'index'=> $validated_data['tatum_derivation_key']]))->getData();
                    $validated_data['blockchain_address'] = $tatum_element->address;
                } else {
                    $tatum_element = (new __TatumAPIController)->createVirtualAccountDepositAddress(new Request(['virtual_account_id' => $asset_wallet->tatum_virtual_account_id]))->getData();
                    $validated_data['blockchain_address'] = $tatum_element->address;
                    $validated_data['tatum_derivation_key'] = $tatum_element->derivationKey;
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
