<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_BuyerExtension;
use App\Models\_SellerExtension;
use App\Models\_PrefItem;

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

            if ( (boolean)_PrefItem::firstWhere('key_slug', 'offer_to_buy_enabled')->value == false ){ $eloquent_query = $eloquent_query->whereNotIn('offer_to',['buy']); }
            if ( (boolean)_PrefItem::firstWhere('key_slug', 'offer_to_sell_enabled')->value == false ){ $eloquent_query = $eloquent_query->whereNotIn('offer_to',['sell']); }

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
        $validated_data = $request->validate([
            'country_name' => ['required', 'exists:__countries,name', 'string'],
            'location' => ['required_if:pymt_method_slug,==,cash_in_person', 'string'],
            'offer_to' => ['required', 'string', Rule::in(['buy', 'sell'])],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'currency_code' => ['required', 'exists:__currencies,code', 'string'],
            'offer_price' => ['required', 'numeric'],
            // for offer_to = buy
            'min_purchase_amount' => ['required_if:offer_to,==,buy', 'integer'],
            'max_purchase_amount' => ['required_if:offer_to,==,buy', 'integer'],
            // for offer_to = sell
            'min_sell_value' => ['required_if:offer_to,==,sell', 'numeric'],
            'max_sell_value' => ['required_if:offer_to,==,sell', 'numeric'],
            'pymt_method_slug' => ['required', 'exists:__pymt_methods,slug', 'string'],
            'pymt_details' => ['required_if:offer_to,==,sell|pymt_method_slug,==,cash_in_person', 'array'],
            'note' => ['nullable', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['online', 'offline'])],
        ]);

        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        // Check if seller is allowed to sell
        if ($validated_data['offer_to'] == 'sell'){
            $seller_seller_extension = _SellerExtension::firstWhere([ 'user_username' => $validated_data['creator_username'] ]);
            if ($seller_seller_extension && $seller_seller_extension->_status!='active'){
                return abort(403,"Current user cannot sell because _SellerExtension is " . $seller_seller_extension->_status);
            }
        }

        // Check if buyer is allowed to buy
        if ($validated_data['offer_to'] == 'buy'){
            $buyer_buyer_extension = _BuyerExtension::firstWhere([ 'user_username' => $validated_data['creator_username'] ]);
            if ($buyer_buyer_extension && $buyer_buyer_extension->_status!='active'){
                return abort(403,"Current user cannot buy because _BuyerExtension is " . $buyer_buyer_extension->_status);
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
        return response()->json( new _OfferResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function show(string $ref_code)
    {
        $element = _Offer::findOrFail($ref_code);
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
            '_status' => ['sometimes', 'string', Rule::in(['online', 'offline'])],
        ]);

        $element = _Offer::findOrFail($ref_code);

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
            'action_note' => $request->update_note,
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->ref_code,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling

        $element->update($validated_data);

        return response()->json( new _OfferResource( $element ) );
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
