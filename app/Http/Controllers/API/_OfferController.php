<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_BuyerExtension;
use App\Models\_SellerExtension;
use App\Models\_PrefItem;
use App\Models\_Asset;
use App\Models\_AssetWallet;

use App\Models\_Offer;
use App\Http\Resources\_OfferResource;
use App\Http\Resources\_OfferResourceCollection;


class _OfferController extends Controller
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
            $result = _Offer::where(['_status'=>'online'])
            ->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString(); 
        }
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->offer_to ){ $simple_query_args = array_merge( $simple_query_args, [ 'offer_to' => request()->offer_to ]); }
            if ( request()->country_name ){ $simple_query_args = array_merge( $simple_query_args, [ 'country_name' => request()->country_name ]); }
            if ( request()->currency_code ){ $simple_query_args = array_merge( $simple_query_args, [ 'currency_code' => request()->currency_code ]); }
            if ( request()->asset_code ){ $simple_query_args = array_merge( $simple_query_args, [ 'asset_code' => request()->asset_code ]); }
            if ( request()->pymt_method_slug ){ $simple_query_args = array_merge( $simple_query_args, [ 'pymt_method_slug' => request()->pymt_method_slug ]); }
            if ( request()->_status && request()->_status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => request()->_status ]); }
            if ( !isset(request()->_status) ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => 'online' ]); }
            if ( request()->creator_username ){ $simple_query_args = array_merge( $simple_query_args, [ 'creator_username' => request()->creator_username ]); }

            $eloquent_query = _Offer::where($simple_query_args);

            if ( _PrefItem::firstWhere('key_slug', 'offer_to_buy_enabled')->value_f() == false ){ $eloquent_query = $eloquent_query->whereNotIn('offer_to',['buy']); }
            if ( _PrefItem::firstWhere('key_slug', 'offer_to_sell_enabled')->value_f() == false ){ $eloquent_query = $eloquent_query->whereNotIn('offer_to',['sell']); }

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _OfferResource::collection( $result ) : new _OfferResourceCollection( $result ) ) : null;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!($request->asset_code && _Asset::where(['code' => $request->asset_code])->exists())){
            return abort(422, "Asset with provided code doesn't exist");
        }
        $api_auth_user_username = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $asset_wallet = (object)['usable_balance_asset_value' => 0];
        if($request->offer_to == 'sell'){
            $asset_wallet = _AssetWallet::firstWhere(['user_username' => $api_auth_user_username, 'asset_code' => $request->asset_code]);
            if (!$asset_wallet){
                return abort(422, 'Current '.$request->asset_code.' balance insufficient to create offer');
            }
        }

        $validated_data = $request->validate([
            'country_name' => ['required', 'exists:__countries,name', 'string'],
            'location' => ['required_if:pymt_method_slug,==,cash_in_person', 'string'],
            'offer_to' => ['required', 'string', Rule::in(['buy', 'sell'])],
            'asset_code' => ['required', 'string'],
            //'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'currency_code' => ['required', 'exists:__currencies,code', 'string'],
            'offer_price' => ['required', 'numeric', 'min:0'],
            // for offer_to = buy
            'min_trade_purchase_amount' => ['required_if:offer_to,==,buy', 'integer', 'between:0,'.$request->max_trade_purchase_amount],
            'max_trade_purchase_amount' => ['required_if:offer_to,==,buy', 'integer', 'between:'.$request->min_trade_purchase_amount.','.$request->offer_total_purchase_amount],
            'offer_total_purchase_amount' => ['required_if:offer_to,==,buy', 'integer', 'between:'.$request->max_trade_purchase_amount.','.$request->offer_total_purchase_amount],
            // for offer_to = sell
            'min_trade_sell_value' => ['required_if:offer_to,==,sell', 'numeric', 'between:0,'.$request->max_trade_sell_value],
            'max_trade_sell_value' => ['required_if:offer_to,==,sell', 'numeric', 'between:'.$request->min_trade_sell_value.','.$request->offer_total_sell_value],
            'offer_total_sell_value' => ['required_if:offer_to,==,sell', 'numeric', 'between:'.$request->max_trade_sell_value.','.$asset_wallet->usable_balance_asset_value],
            'buyer_cmplt_trade_mins_tmt' => ['required', 'integer', 'between:'._PrefItem::firstWhere('key_slug', 'buyer_open_trade_min_mins_tmt')->value_f().','._PrefItem::firstWhere('key_slug', 'buyer_cmplt_trade_max_mins_tmt')->value_f() ],
            'pymt_method_slug' => ['required', 'exists:__pymt_methods,slug', 'string'],
            'pymt_details' => ['required_if:offer_to,==,sell|pymt_method_slug,==,cash_in_person', 'array'],
            'note' => ['nullable', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['online', 'offline'])],
        ]);

        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['creator_username'] = $api_auth_user_username;
        $validated_data['trade_txn_fee_fctr'] = _PrefItem::firstWhere('key_slug', 'trade_txn_fee_fctr')->value_f();

        // Check if seller is allowed to sell
        if ($validated_data['offer_to'] == 'sell'){
            $seller_seller_extension = _SellerExtension::firstWhere([ 'user_username' => $validated_data['creator_username'] ]);
            if ($seller_seller_extension && $seller_seller_extension->_status!='active'){
                return abort(403,"Current user cannot sell because _SellerExtension is ".$seller_seller_extension->_status);
            }
        }

        // Check if buyer is allowed to buy
        if ($validated_data['offer_to'] == 'buy'){
            $buyer_buyer_extension = _BuyerExtension::firstWhere([ 'user_username' => $validated_data['creator_username'] ]);
            if ($buyer_buyer_extension && $buyer_buyer_extension->_status!='active'){
                return abort(403,"Current user cannot buy because _BuyerExtension is ".$buyer_buyer_extension->_status);
            }
        }

        $element = _Offer::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Offer entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->ref_code,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _OfferResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function show(string $ref_code)
    {
        $element = _Offer::find($ref_code);
        if (!$element) return abort(404, 'Offer with specified reference code not found');
        return response()->json( new _OfferResource( $element ) );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, string $ref_code)
    {
        $validated_data = $request->validate([
            'update_note' => ['required', 'string', 'max:255'],
            // for offer_to = buy
            'min_trade_purchase_amount' => ['sometimes', 'integer'],
            'max_trade_purchase_amount' => ['sometimes', 'integer'],
            'offer_total_purchase_amount' => ['sometimes', 'integer'],
            'filled_amount' => ['sometimes', 'integer'],
            // for offer_to = sell
            'min_trade_sell_value' => ['sometimes', 'numeric', 'min:0'],
            'max_trade_sell_value' => ['sometimes', 'numeric', 'min:0'],
            'offer_total_sell_value' => ['sometimes', 'numeric', 'min:0'],
            'filled_value' => ['sometimes', 'numeric', 'min:0'],
            '_status' => ['sometimes', 'string', Rule::in(['online', 'offline'])],
        ]);

        $element = _Offer::findOrFail($ref_code);
        $_status = isset($validated_data['_status']) ? $validated_data['_status'] : $element->_status;

        if ($element->offer_to == 'buy'){
            $min_trade_purchase_amount = isset($validated_data['min_trade_purchase_amount']) ? $validated_data['min_trade_purchase_amount'] : $element->min_trade_purchase_amount;
            $max_trade_purchase_amount = isset($validated_data['max_trade_purchase_amount']) ? $validated_data['max_trade_purchase_amount'] : $element->max_trade_purchase_amount;
            $offer_total_purchase_amount = isset($validated_data['offer_total_purchase_amount']) ? $validated_data['offer_total_purchase_amount'] : $element->offer_total_purchase_amount;
            $filled_amount = isset($validated_data['filled_amount']) ? $validated_data['filled_amount'] : $element->filled_amount;
            if ($max_trade_purchase_amount > $offer_total_purchase_amount){
                return abort(422,'Maximum limit per trade cannot be greater than total available purchase amount');
            }
            if ($filled_amount > $offer_total_purchase_amount){
                return abort(422,'Filled amount cannot be greater than total available purchase amount');
            }
            if ($_status == 'online' && ($min_trade_purchase_amount > ($offer_total_purchase_amount - $filled_amount))){
                if ($filled_amount == $offer_total_purchase_amount){
                    return abort(422,'Offer appears to be filled and cannot be online');
                }
                return abort(422,'Minimum limit per trade cannot be greater than amount remaining to fill for an online offer');
            }
        }

        if ($element->offer_to == 'sell'){
            $min_trade_sell_value = isset($validated_data['min_trade_sell_value']) ? $validated_data['min_trade_sell_value'] : $element->min_trade_sell_value;
            $max_trade_sell_value = isset($validated_data['max_trade_sell_value']) ? $validated_data['max_trade_sell_value'] : $element->max_trade_sell_value;
            $offer_total_sell_value = isset($validated_data['offer_total_sell_value']) ? $validated_data['offer_total_sell_value'] : $element->offer_total_sell_value;
            $filled_value = isset($validated_data['filled_value']) ? $validated_data['filled_value'] : $element->filled_value;
            if ($max_trade_sell_value > $offer_total_sell_value){
                return abort(422,'Maximum limit per trade cannot be greater than total available sale value');
            }
            if ($filled_value > $offer_total_sell_value){
                return abort(422,'Filled value cannot be greater than total available sale value');
            }
            if ($_status == 'online' && ($min_trade_sell_value > ($offer_total_sell_value - $filled_value))){
                if ($filled_value == $offer_total_sell_value){
                    return abort(422,'Offer appears to be filled and cannot be online');
                }
                return abort(422,'Minimum limit per trade cannot be greater than value remaining to fill for an online offer');
            }
        }

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
            'action_note' => $request->update_note,
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->ref_code,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _OfferResource( $element ) );
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
