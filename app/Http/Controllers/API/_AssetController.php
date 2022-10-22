<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_PrefItem;

use App\Models\_Asset;
use App\Http\Resources\_AssetResource;
use App\Http\Resources\_AssetResourceCollection;

class _AssetController extends Controller
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

            if ( request()->_status && request()->_status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => request()->_status ]); }
            if ( !isset(request()->_status) ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => 'active' ]); }

            $eloquent_query = _Asset::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page ?? count($eloquent_query->get()))->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _AssetResource::collection( $result ) : new _AssetResourceCollection( $result ) ) : null;
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
            'name' => ['required', 'string', 'max:64', 'unique:__assets,name'],
            'code' => ['required', 'string', 'max:64', 'unique:__assets,code'],
            'unit' => ['required', 'string', 'max:64'],
            'chain' => ['required', 'string', 'max:64'],
            'smallest_display_unit' => ['required', 'numeric', 'min:0'],
            'withdrawal_txn_fee_usd_fctr' => ['required', 'numeric', 'min:0'],
            'withdrawal_min_limit' => ['required', 'numeric', 'min:0'],
            'withdrawal_max_limit' => ['required', 'numeric', 'min:0'],
            'usd_asset_exchange_rate' => ['sometimes', 'numeric', 'min:0'],
            'bc_txn_id_scan_url' => ['required', 'string', 'max:255'],
            'onchain_disclaimer' => ['required', 'string'],
            'mnemonic' => ['required_without:gp_owner_bc_address', 'string', 'max:500'],
            'gp_owner_bc_address' => ['required_without:mnemonic', 'string', 'max:128'],
            'ttm_gp_last_activated_index' => ['sometimes', 'integer'],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        
        if ( !isset($validated_data['gp_owner_bc_address']) && _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            switch ($validated_data['chain']) {
                case 'ETH':
                    $validated_data['xpub'] = (new Tatum\Blockchain\EthereumController)->EthGenerateWallet(new Request(['mnemonic' => $validated_data['mnemonic']]))->getData()->xpub;
                    $validated_data['gp_owner_bc_address'] = (new Tatum\Blockchain\EthereumController)->EthGenerateAddress(new Request(['xpub' => $validated_data['xpub'], 'index' => 0]))->getData()->address;
                    //$validated_data['gp_owner_bc_address_pkey'] = (new Tatum\Blockchain\EthereumController)->EthGenerateAddressPrivateKey(new Request(['mnemonic' => $validated_data['mnemonic'], 'index' => 0]))->getData()->key;
                    break;
                case 'MATIC':
                    $validated_data['xpub'] = (new Tatum\Blockchain\PolygonController)->PolygonGenerateWallet(new Request(['mnemonic' => $validated_data['mnemonic']]))->getData()->xpub;
                    $validated_data['gp_owner_bc_address'] = (new Tatum\Blockchain\PolygonController)->PolygonGenerateAddress(new Request(['xpub' => $validated_data['xpub'], 'index' => 0]))->getData()->address;
                    //$validated_data['gp_owner_bc_address_pkey'] = (new Tatum\Blockchain\PolygonController)->PolygonGenerateAddressPrivateKey(new Request(['mnemonic' => $validated_data['mnemonic'], 'index' => 0]))->getData()->key;
                    break;
                case 'TRON':
                    $validated_data['xpub'] = (new Tatum\Blockchain\TronController)->GenerateTronwallet(new Request(['mnemonic' => $validated_data['mnemonic']]))->getData()->xpub;
                    $validated_data['gp_owner_bc_address'] = (new Tatum\Blockchain\TronController)->TronGenerateAddress(new Request(['xpub' => $validated_data['xpub'], 'index' => 0]))->getData()->address;
                    //$validated_data['gp_owner_bc_address_pkey'] = (new Tatum\Blockchain\TronController)->TronGenerateAddressPrivateKey(new Request(['mnemonic' => $validated_data['mnemonic'], 'index' => 0]))->getData()->key;
                    break;
            }
        }
        
        if ( !_Asset::where(['chain' => $validated_data['chain']])->exists() ){
            $validated_data['ttm_gp_chain_addresses_storage'] = true;
        }

        if ( !isset($validated_data['usd_asset_exchange_rate']) && _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            $validated_data['usd_asset_exchange_rate'] = 1/((new Tatum\Utils\ExchangeRateController)->getExchangeRate(new Request(['currency' => $validated_data['code'], 'basePair' => 'USD']))->getData()->value);
        }

        $element = _Asset::create($validated_data);
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Asset entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling

        (new _AssetController)->calculate_next_gp_addresses_batch( $element->id );

        if ($request->expectsJson()) return response()->json( new _AssetResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateUSDRate(int $id)
    {
        $element = _Asset::findOrFail($id);
        $ttm_element = (new Tatum\Utils\ExchangeRateController)->getExchangeRate(new Request(['currency' => $element->code, 'basePair' => 'USD']))->getData();
        try {
            (new _AssetController)->update( new Request(['usd_asset_exchange_rate' => (1/$ttm_element->value)]), $element->id );
        } catch (\Throwable $th) {}
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
            'ttm_gp_last_activated_index' => ['sometimes', 'integer', 'between:1,255'],
            'ttm_gp_calculated_batch_addresses' => ['sometimes', 'array'],
            'smallest_display_unit' => ['sometimes', 'numeric', 'min:0'],
            'withdrawal_txn_fee_usd_fctr' => ['sometimes', 'numeric', 'min:0'],
            'withdrawal_min_limit' => ['sometimes', 'integer', 'min:0'],
            'withdrawal_max_limit' => ['sometimes', 'integer', 'min:0'],
            'usd_asset_exchange_rate' => ['sometimes', 'numeric', 'min:0'],
            'onchain_disclaimer' => ['sometimes', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'deactivated'])],
        ]);

        $element = _Asset::findOrFail($id);

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
            'action_note' => 'Updating of _Asset entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _AssetResource( $element ) );
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

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function calculate_next_gp_addresses_batch(int $id)
    {
        $validated_data = ['calculation_batch_size' => 500];
        $element = _Asset::findOrFail($id)->makeVisible(['ttm_gp_last_calculated_index']);
        if (!$element->ttm_gp_chain_addresses_storage){
            return abort(422, 'Asset not storage for gaspump addresses');
        }
        // Calculate
        $from = ($element->ttm_gp_last_calculated_index ?? -1) + 1;
        $validated_data['ttm_gp_last_calculated_index'] = $from + $validated_data['calculation_batch_size'] - 1;
        $ttm_element = (new Tatum\SmartContracts\GasPumpController)->PrecalculateGasPumpAddresses(new Request([
            'chain' => $element->chain,
            'owner' => $element->gp_owner_bc_address,
            'from' => $from,
            'to' => $validated_data['ttm_gp_last_calculated_index'],
        ]))->getData();
        $validated_data['ttm_gp_calculated_batch_addresses'] = $ttm_element;
        $element->update($validated_data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function activate_next_gp_addresses_batch(Request $request, int $id)
    {
        $validated_data = $request->validate([
            'activation_batch_size' => ['required', 'integer', 'between:1,270'],
        ]);

        $element = _Asset::findOrFail($id)->makeVisible(['ttm_gp_last_activated_index']);
        if (!$element->ttm_gp_chain_addresses_storage){
            return abort(422, 'Asset not storage for gaspump addresses');
        }
        // Activate
        $from = ($element->ttm_gp_last_activated_index ?? -1) + 1;
        $validated_data['ttm_gp_last_activated_index'] = $from + $validated_data['activation_batch_size'] - 1;
        (new Tatum\SmartContracts\GasPumpController)->ActivateGasPumpAddresses(new Request(array_filter([
            'chain' => $element->chain,
            'owner' => $element->gp_owner_bc_address,
            'from' => $from,
            'to' => $to,
            'feeLimit' => ($element->chain === 'TRON' ? 30 * $validated_data['activation_batch_size'] : null),
            'signatureId' => env('TATUM_KMS_'.$element->chain.'_WALLET_SIGNATURE_ID'),
            'index' => 0,
        ], static function($var){ return $var !== null; } )));
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _AssetResource( $element ) );
    }
}
