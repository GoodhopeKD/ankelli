<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_AssetAccount;
use App\Models\_PrefItem;
use App\Models\_Offer;

use App\Models\_Trade;
use App\Http\Resources\_TradeResource;
use App\Http\Resources\_TradeResourceCollection;

class _TradeController extends Controller
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
            $result = _Trade::where(['_status'=>'active'])
            ->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString(); 
        }
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->was_offer_to ){ $simple_query_args = array_merge( $simple_query_args, [ 'was_offer_to' => request()->was_offer_to ]); }
            if ( request()->country_name ){ $simple_query_args = array_merge( $simple_query_args, [ 'country_name' => request()->country_name ]); }
            if ( request()->currency_code ){ $simple_query_args = array_merge( $simple_query_args, [ 'currency_code' => request()->currency_code ]); }
            if ( request()->asset_code ){ $simple_query_args = array_merge( $simple_query_args, [ 'asset_code' => request()->asset_code ]); }
            if ( request()->pymt_method_slug ){ $simple_query_args = array_merge( $simple_query_args, [ 'pymt_method_slug' => request()->pymt_method_slug ]); }
            if ( request()->_status && request()->_status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => request()->_status ]); }
            if ( !isset(request()->_status) ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => 'active' ]); }

            $eloquent_query = _Trade::where($simple_query_args);

            if ( request()->user_username && is_string( request()->user_username ) ){
                $eloquent_query = $eloquent_query
                ->where(['creator_username' => request()->user_username, 'visible_to_creator' => true])
                ->orWhere(function($query) { $query->where(['offer_creator_username' => request()->user_username, 'visible_to_offer_creator' => true]); });
            }
            
            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _TradeResource::collection( $result ) : new _TradeResourceCollection( $result ) ) : null;
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
            'offer_ref_code' => ['required', 'exists:__offers,ref_code', 'string'],
            'currency_amount' => ['required', 'numeric'],
            'pymt_details' => ['sometimes', 'array'],
            /*'pymt_details.physical_address' => ['sometimes', 'string', 'max:255'],
            'pymt_details.email_address' => ['sometimes', 'string', 'email', 'max:64'],
            'pymt_details.fullname' => ['sometimes', 'string', 'max:255'],
            'pymt_details.account_no' => ['sometimes', 'string', 'max:64'],
            'pymt_details.phone_no' => ['sometimes', 'string', 'max:64'],*/
            '_status' => ['sometimes', 'string', Rule::in(['active', 'cancelled', 'flagged', 'completed'])],
        ]);

        $offer = _Offer::find($validated_data['offer_ref_code'])->makeVisible(['pymt_details']);

        $validated_data['platform_charge_asset_factor'] = (float)_PrefItem::firstWhere('key_slug', 'platform_charge_asset_factor')->value;
        $validated_data['asset_value'] = ($validated_data['currency_amount'] / $offer->offer_price) * (1 + $validated_data['platform_charge_asset_factor']);

        if ($offer->offer_to == 'buy'){
            if (!($validated_data['currency_amount'] >= $offer->min_purchase_amount && $validated_data['currency_amount'] <= $offer->max_purchase_amount)){
                return abort(422, 'Amount not within limits.');
            }
        } else {
            if (!($validated_data['asset_value'] >= $offer->min_sell_value && $validated_data['asset_value'] <= $offer->max_sell_value)){
                return abort(422, 'Asset Value not within limits.');
            }
        }
        $validated_data = array_filter( array_merge( $offer->toArray() , [ '_status' => null ], $validated_data ) );
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        if ( $validated_data['creator_username'] == $offer->creator_username ){
            return abort(422, 'Cannot trade with self.');
        }
        $seller_username = $offer->offer_to == 'buy' ? $validated_data['creator_username'] : $offer->creator_username;

        // Lock seller asset in escrow
        $seller_asset_account = _AssetAccount::firstWhere([
            'user_username' => $seller_username,
            'asset_code' => $offer->asset_code
        ]);

        if ( !$seller_asset_account ){ return abort(422, 'Current ' . $offer->asset_code . ' balance insufficient for transaction.'); }
        if ( $seller_asset_account->_status == 'frozen' ){ return abort(422, 'Selected asset is frozen.'); }

        $validated_data['was_offer_to'] = $offer->offer_to;
        $validated_data['offer_creator_username'] = $offer->creator_username;
        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $seller_new_asset_value = $seller_asset_account->asset_value - $validated_data['asset_value'];

        if ( $seller_new_asset_value < 0 ){ return abort(422, 'Current ' . $offer->asset_code . ' balance insufficient for transaction.'); }
        
        (new _AssetAccountController)->update( new Request([
            'asset_value' => $seller_new_asset_value
        ]), $seller_asset_account->id );

        $escrow_asset_account = _AssetAccount::firstOrCreate([
            'user_username' => 'escrow', 
            'asset_code' => $offer->asset_code
        ]);
        (new _AssetAccountController)->update( new Request([
            'asset_value' => $escrow_asset_account->asset_value + $validated_data['asset_value'],
        ]), $escrow_asset_account->id );
        // End lock in escrow

        $element = _Trade::create($validated_data);
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Trade entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => '__trades',
            'entry_uid' => $element->ref_code,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _TradeResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function show(string $ref_code)
    {
        $element = _Trade::find($ref_code);
        return response()->json( new _TradeResource( $element ) );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $ref_code)
    {
        $validated_data = $request->validate([
            'pymt_declared' => ['sometimes', 'boolean'],
            'pymt_confirmed' => ['sometimes', 'boolean'],
            'visible_to_creator' => ['sometimes', 'boolean'],
            'visible_to_offer_creator' => ['sometimes', 'boolean'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'cancelled', 'flagged', 'completed'])],
        ]);

        $element = _Trade::find($ref_code);
        
        if (isset($validated_data['pymt_declared']) && $validated_data['pymt_declared'] == true){
            $validated_data['pymt_declared_datetime'] = now()->toDateTimeString();
        }

        if (isset($validated_data['pymt_confirmed']) && $validated_data['pymt_confirmed'] == true){
            $validated_data['pymt_confirmed_datetime'] = now()->toDateTimeString();
            $validated_data['_status'] = 'active';

            // Unlock asset from escrow
            $seller_username = $element->was_offer_to == 'buy' ? $element->creator_username : $element->offer_creator_username;
            $buyer_username = $element->was_offer_to == 'sell' ? $element->creator_username : $element->offer_creator_username;
            $seller_asset_account = _AssetAccount::firstWhere([
                'user_username' => $seller_username, 
                'asset_code' => $element->asset_code,
            ]);
            (new _AssetAccountController)->update( new Request([
                'asset_value' => $seller_asset_account->asset_value + $element->asset_value
            ]), $seller_asset_account->id );

            $escrow_asset_account = _AssetAccount::firstWhere([
                'user_username' => 'escrow',
                'asset_code' => $element->asset_code,
            ]);
            (new _AssetAccountController)->update( new Request([
                'asset_value' => $escrow_asset_account->asset_value - $element->asset_value
            ]), $escrow_asset_account->id );
            // End unlock asset from escrow
            
            (new _TransactionController)->store( new Request([
                'note' => 'Trade asset release.',
                'source_user_username' => $seller_username, 
                'destination_user_username' => $buyer_username, 
                'asset_code' => $element->asset_code,
                'source_account_transfer_value' => $element->asset_value,
                'platform_charge_asset_factor' => $element->platform_charge_asset_factor,
            ]));
        }

        if ( $element->_status == 'active' && ( isset($validated_data['pymt_declared_datetime']) || isset($element->pymt_declared_datetime) ) && ( isset($validated_data['pymt_confirmed_datetime']) || isset($element->pymt_confirmed_datetime) )){
            $validated_data['_status'] = 'completed';
        }

        // Handle _Log
        $log_entry_update_result = [];
        foreach ( $validated_data as $key => $value ) {
            if ( $element->{$key} != $value ){
                array_push( $log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        (new _LogController)->store( new Request([
            'action_note' => 'Updating of _Trade entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => '__trades',
            'entry_uid' => $element->ref_code,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling

        $element->update($validated_data);

        return response()->json( new _TradeResource( $element ) );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $ref_code)
    {
        //
    }
}
