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

        if ($result === null) {
            $simple_query_args = [];

            if (request()->_status && request()->_status !== 'all') { $simple_query_args = array_merge($simple_query_args, [ '_status' => request()->_status ]); }
            if (!isset(request()->_status)) { $simple_query_args = array_merge($simple_query_args, [ '_status' => 'active' ]); }

            $eloquent_query = _Asset::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page ?? count($eloquent_query->get()))->withQueryString();
        }

        return $result ? (request()->get_with_meta && request()->get_with_meta == true ? _AssetResource::collection($result) : new _AssetResourceCollection($result)) : null;
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
            'centralization_threshold' => ['required', 'numeric', 'min:0'],
            'bc_txn_id_scan_url' => ['required', 'string', 'max:255'],
            'onchain_disclaimer' => ['required', 'string'],
            'xpub' => ['required', 'string', 'max:255'],
            'ttm_gp_last_activated_index' => ['sometimes', 'integer'],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null);
        
        if (_PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f()) {
            switch ($validated_data['chain']) {
                case 'ETH':
                    $validated_data['gp_owner_bc_address'] = (new Tatum\Blockchain\EthereumController)->EthGenerateAddress(new Request(['xpub' => $validated_data['xpub'], 'index' => 0]))->getData()->address;
                    break;
                case 'MATIC':
                    $validated_data['gp_owner_bc_address'] = (new Tatum\Blockchain\PolygonController)->PolygonGenerateAddress(new Request(['xpub' => $validated_data['xpub'], 'index' => 0]))->getData()->address;
                    break;
                case 'TRON':
                    $validated_data['gp_owner_bc_address'] = (new Tatum\Blockchain\TronController)->TronGenerateAddress(new Request(['xpub' => $validated_data['xpub'], 'index' => 0]))->getData()->address;
                    break;
            }
        }
        
        if (!_Asset::where(['chain' => $validated_data['chain']])->exists()) {
            $validated_data['ttm_gp_chain_addresses_storage'] = true;
        }

        if (!isset($validated_data['usd_asset_exchange_rate']) && _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f()) {
            $validated_data['usd_asset_exchange_rate'] = 1/((new Tatum\Utils\ExchangeRateController)->getExchangeRate(new Request(['currency' => $validated_data['code'], 'basePair' => 'USD']))->getData()->value);
        }

        if (!isset($validated_data['usd_asset_exchange_rate'])) {
            switch ($validated_data['chain']) {
                case 'ETH':
                    $validated_data['usd_asset_exchange_rate'] = 0.00074;
                    break;
                case 'MATIC':
                    $validated_data['usd_asset_exchange_rate'] = 100;
                    break;
                case 'TRON':
                    $validated_data['usd_asset_exchange_rate'] = 15.6;
                    break;
            }
        }

        $element = _Asset::create($validated_data);
        
        // Handle _Log
        (new _LogController)->store(new Request([
            'action_note' => 'Addition of _Asset entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling

        if (_PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f()) {
            (new _AssetController)->calculate_next_gp_addresses_batch($element->id);
        }

        if ($request->expectsJson()) return response()->json(new _AssetResource($element));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $code
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $element = _Asset::find($id);
        if (!$element) return abort(404, 'Asset with specified reference id not found');
        return response()->json(new _AssetResource($element));
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
            'centralization_threshold' => ['sometimes', 'numeric', 'min:0'],
            'onchain_disclaimer' => ['sometimes', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'deactivated'])],
        ]);

        $element = _Asset::findOrFail($id);

        // Handle _Log
        $log_entry_update_result = [];
        foreach ($validated_data as $key => $value) {
            if (in_array($key, $element->getFillable()) && $element->{$key} != $value) {
                array_push($log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        if (!count($log_entry_update_result)) return abort(422, 'No values were updated');
        (new _LogController)->store(new Request([
            'action_note' => 'Updating of _Asset entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json(new _AssetResource($element));
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
    public function update_usd_asset_exchange_rate(int $id)
    {
        $element = _Asset::findOrFail($id);
        $ttm_element = (new Tatum\Utils\ExchangeRateController)->getExchangeRate(new Request(['currency' => $element->code, 'basePair' => 'USD']))->getData();
        try {
            (new _AssetController)->update(new Request(['usd_asset_exchange_rate' => (1/$ttm_element->value)]), $element->id);
        } catch (\Throwable $th) {}
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
        if (!$element->ttm_gp_chain_addresses_storage) {
            return abort(422, 'Asset not storage for gaspump addresses');
        }
        // Calculate
        $from = ($element->ttm_gp_last_calculated_index ?? -1) + 1;
        $validated_data['ttm_gp_last_calculated_index'] = $from + $validated_data['calculation_batch_size'] - 1;
        $validated_data['ttm_gp_calculated_batch_addresses'] = (new Tatum\SmartContracts\GasPumpController)->PrecalculateGasPumpAddresses(new Request([
            'chain' => $element->chain,
            'owner' => $element->gp_owner_bc_address,
            'from' => $from,
            'to' => $validated_data['ttm_gp_last_calculated_index'],
        ]))->getData();
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
        if (!$element->ttm_gp_chain_addresses_storage) {
            return abort(422, 'Asset not storage for gaspump addresses');
        }
        // Activate
        $validated_data['ttm_gp_last_activated_index'] = ($element->ttm_gp_last_activated_index ?? -1) + $validated_data['activation_batch_size'];
        (new _TransactionController)->process_gp_addresses_activation(new Request([
            'asset_code' => $element->code,
            'activation_batch_size' => $validated_data['activation_batch_size'],
        ]));
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json(new _AssetResource($element));
    }
}
