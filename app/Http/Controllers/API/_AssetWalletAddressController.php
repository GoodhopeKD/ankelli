<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_PrefItem;
use App\Models\_Asset;
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

            if ( request()->user_username && request()->user_username !== 'platform_wallet_users' ){ $simple_query_args = array_merge( $simple_query_args, [ 'user_username' => request()->user_username ]); }
            if ( request()->asset_code ){ $simple_query_args = array_merge( $simple_query_args, [ 'asset_code' => request()->asset_code ]); }

            $eloquent_query = _AssetWalletAddress::where($simple_query_args);
            
            if (request()->user_username === 'platform_wallet_users')
            $eloquent_query = $eloquent_query->whereIn('user_username', ['busops', 'reserves']);

            $result = $eloquent_query->paginate(request()->per_page)->withQueryString();
        }

        if ( request()->user_username === 'platform_wallet_users' && isset( request()->asset_code ) ){
            $result->push(new _AssetWalletAddress([
                'user_username' => 'gaspump',
                'bc_address' => _Asset::firstWhere(['code' => request()->asset_code ])->gp_owner_bc_address,
                'asset_code' => request()->asset_code,
            ]));
        }

        return $result ? (new _AssetWalletAddressResourceCollection( $result ))->with_balance( request()->user_username === 'platform_wallet_users' ) : null;
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
            //'ttm_derivation_key' => ['sometimes', 'integer', 'between:0,2147483647'],
            'user_username' => ['required', 'string', 'exists:__users,username'],
            'bc_address' => ['sometimes', 'string'],
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
        ]);

        $max_per_user_per_asset_code = 1;
        //if ( $validated_data['user_username'] === 'reserves' ) $max_per_user_per_asset_code = 2;

        if ( _AssetWalletAddress::where(['user_username' => $validated_data['user_username'], 'asset_code' => $validated_data['asset_code']])->get()->count() >= $max_per_user_per_asset_code ){
            return abort(422, 'Max number of addresses per crypto asset for this user reached');
        }

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() && !isset($validated_data['bc_address']) ){
            $asset_wallet = _AssetWallet::firstWhere(['user_username' => $validated_data['user_username'], 'asset_code' => $validated_data['asset_code']])->makeVisible(['ttm_virtual_account_id']);
            if ( false ){
                $ttm_element = (new Tatum\VirtualAccounts\BCAddressController)->generateDepositAddress(new Request(['id' => $asset_wallet->ttm_virtual_account_id]))->getData();
                $validated_data['ttm_derivation_key'] = $ttm_element->derivationKey;
                $validated_data['bc_address'] = $ttm_element->address;
            } else {
                $address_saved = false;
                while ($address_saved === false) {
                    $asset = _Asset::firstWhere(['chain' => $asset_wallet->asset_chain, 'chain_gp_addresses_storage' => true])->makeVisible(['ttm_activated_unused_gp_addresses']);
                    if (!count($asset->ttm_activated_unused_gp_addresses)){
                        (new _AssetController)->activate_next_gp_addresses_batch($asset->id);
                        $asset = _Asset::firstWhere(['chain' => $asset_wallet->asset_chain, 'chain_gp_addresses_storage' => true])->makeVisible(['ttm_activated_unused_gp_addresses']);
                    }
                    $ttm_activated_unused_gp_addresses = $asset->ttm_activated_unused_gp_addresses;
                    $chosen_gp_address = array_shift($ttm_activated_unused_gp_addresses);
                    (new _AssetController)->update(new Request(['ttm_activated_unused_gp_addresses' => $ttm_activated_unused_gp_addresses]), $asset->id);
                    $address_usable = false;
                    try {
                        if ((new Tatum\VirtualAccounts\BCAddressController)->addressExists(new Request(['address' => strtolower( $chosen_gp_address ), 'currency' => $asset_wallet->asset_code]))->getData()){ $address_usable = false; }
                    } catch (\Throwable $th) {
                        $message = $th->getMessage();
                        if (str_contains($message, 'The combination of address')){ $address_usable = true; }
                        if (str_contains($message, 'Unable to find sender account')){ $address_usable = false; }
                    }
                    if ( $address_usable ){
                        $ttm_element = (new Tatum\VirtualAccounts\BCAddressController)->assignAddress(new Request(['id' => $asset_wallet->ttm_virtual_account_id, 'address' => $chosen_gp_address ]))->getData();
                        $validated_data['bc_address'] = $ttm_element->address;
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
    public function show(int $id)
    {
        $element = _AssetWalletAddress::find($id);
        if (!$element) return abort(404, '_AssetWalletAddress with specified reference code not found');
        return response()->json( (new _AssetWalletAddressResource( $element ))->with_balance(true) );
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
