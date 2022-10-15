<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_PrefItem;
use App\Models\_AssetCustodialWalletAddress;

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
            'fe_asset_code' => ['required', 'string', 'max:64'],
            'chain' => ['required', 'string', 'max:64'],
            'smallest_display_unit' => ['required', 'numeric', 'min:0'],
            'withdrawal_txn_fee_usd_fctr' => ['required', 'numeric', 'min:0'],
            'withdrawal_min_limit_usd_fctr' => ['required', 'integer', 'min:0'],
            'withdrawal_max_limit_usd_fctr' => ['required', 'integer', 'min:0'],
            'usd_asset_exchange_rate' => ['required', 'numeric', 'min:0'],
            'onchain_disclaimer' => ['required', 'string'],
            'mnemonic' => ['required', 'string', 'max:500'],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        
        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            $ttm_element = (new Tatum\Blockchain\EthereumController)->EthGenerateWallet(new Request(['mnemonic' => $validated_data['mnemonic']]))->getData();
            $validated_data['xpub'] = $ttm_element->xpub;
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
    public function updateRate(int $id)
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
            'smallest_display_unit' => ['sometimes', 'numeric', 'min:0'],
            'withdrawal_txn_fee_usd_fctr' => ['sometimes', 'numeric', 'min:0'],
            'withdrawal_min_limit_usd_fctr' => ['sometimes', 'integer', 'min:0'],
            'withdrawal_max_limit_usd_fctr' => ['sometimes', 'integer', 'min:0'],
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
}
