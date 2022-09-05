<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_BuyerExtension;
use App\Models\_SellerExtension;
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
            'pymt_details.physical_address' => ['sometimes', 'string', 'max:255'],
            'pymt_details.email_address' => ['sometimes', 'string', 'email', 'max:64'],
            'pymt_details.fullname' => ['sometimes', 'string', 'max:255'],
            'pymt_details.account_holder_name' => ['sometimes', 'string', 'max:128'],
            'pymt_details.account_no' => ['sometimes', 'string', 'max:64'],
            'pymt_details.account_key' => ['sometimes', 'string', 'max:8'],
            'pymt_details.phone_no' => ['sometimes', 'string', 'max:64'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'cancelled', 'flagged', 'completed'])],
        ]);

        $offer = _Offer::findOrFail($validated_data['offer_ref_code'])->makeVisible(['pymt_details']);

        $validated_data['platform_charge_asset_factor'] = (float)_PrefItem::firstWhere('key_slug', 'platform_charge_asset_factor')->value;
        $validated_data['asset_value'] = $validated_data['currency_amount'] / $offer->offer_price;
        $validated_data['asset_value_escrowed'] = $validated_data['asset_value'] * (1 + $validated_data['platform_charge_asset_factor']);

        if ($offer->offer_to == 'buy'){
            if (!($validated_data['currency_amount'] >= $offer->min_purchase_amount && $validated_data['currency_amount'] <= $offer->max_purchase_amount)){
                return abort(422, 'Amount not within limits.');
            }
        } else {
            if (!($validated_data['asset_value_escrowed'] >= $offer->min_sell_value && $validated_data['asset_value_escrowed'] <= $offer->max_sell_value)){
                return abort(422, 'Asset Value not within limits.');
            }
        }
        $validated_data = array_filter( array_merge( $offer->toArray() , [ '_status' => null ], $validated_data ) );
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        if ( $validated_data['creator_username'] == $offer->creator_username ){
            return abort(422, 'Cannot trade with self.');
        }
        $seller_username = $offer->offer_to == 'buy' ? $validated_data['creator_username'] : $offer->creator_username;
        $buyer_username = $offer->offer_to == 'sell' ? $validated_data['creator_username'] : $offer->creator_username;

        // Check if seller is allowed to sell
        $seller_seller_extension = _SellerExtension::firstWhere([ 'user_username' => $seller_username ]);
        if ($seller_seller_extension){
            if ($seller_seller_extension->_status!='active'){
                session()->put('api_auth_user_username', 'system');
                (new _OfferController)->update(new Request([
                    '_status' => 'offline', 
                    'update_note' => 'Set offline by the system because _SellerExtension is ' . $seller_seller_extension->_status
                ]), $offer->ref_code );
                session()->put('api_auth_user_username', $validated_data['creator_username']);
                return abort(422,"Selected seller cannot sell because _SellerExtension is " . $seller_seller_extension->_status);
            }
        } else {
            (new _SellerExtensionController)->store( new Request([ 'user_username' => $seller_username ]));
        }

        // Check if buyer is allowed to buy
        $buyer_buyer_extension = _BuyerExtension::firstWhere([ 'user_username' => $buyer_username ]);
        if ($buyer_buyer_extension){
            if ($buyer_buyer_extension->_status!='active'){
                session()->put('api_auth_user_username', 'system');
                (new _OfferController)->update(new Request([
                    '_status' => 'offline', 
                    'update_note' => 'Set offline by the system because _BuyerExtension is ' . $buyer_buyer_extension->_status
                ]), $offer->ref_code );
                session()->put('api_auth_user_username', $validated_data['creator_username']);
                return abort(422,"Selected buyer cannot buy because _BuyerExtension is " . $buyer_buyer_extension->_status);
            }
        } else {
            (new _BuyerExtensionController)->store( new Request([ 'user_username' => $buyer_username ]));
        }

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
        $seller_new_asset_value = $seller_asset_account->asset_value - $validated_data['asset_value_escrowed'];

        if ( $seller_new_asset_value < 0 ){ return abort(422, 'Current ' . $offer->asset_code . ' balance insufficient for transaction.'); }
        
        $silent_lock_in_escrow = false;
        if ($silent_lock_in_escrow) {
            (new _AssetAccountController)->update( new Request([
                'asset_value' => $seller_new_asset_value
            ]), $seller_asset_account->id );

            $escrow_asset_account = _AssetAccount::firstOrCreate([
                'user_username' => 'escrow',
                'asset_code' => $offer->asset_code
            ]);
            (new _AssetAccountController)->update( new Request([
                'asset_value' => $escrow_asset_account->asset_value + $validated_data['asset_value_escrowed'],
            ]), $escrow_asset_account->id );
        } else {
            (new _TransactionController)->store( new Request([
                'description' => 'Lock asset in escrow for trade "' . $validated_data['ref_code'] . '"',
                'type' => 'escrow_asset_lock',
                'source_user_username' => $seller_username, 
                'destination_user_username' => 'escrow', 
                'asset_code' => $offer->asset_code,
                'transfer_value' => $validated_data['asset_value_escrowed'],
            ]));
        }
        sleep(1);
        // End lock in escrow

        $element = _Trade::create($validated_data);

        session()->put('api_auth_user_username', 'system');
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $element->ref_code,
            'body' => 'Trade has been initialized. Use this chat space to communicate with trade peer.'
        ]));
        session()->put('api_auth_user_username', $validated_data['creator_username']);
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Trade entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
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
        $element = _Trade::findOrFail($ref_code);
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

        $element = _Trade::findOrFail($ref_code);
        $validated_data['updater_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        
        if (isset($validated_data['pymt_declared']) && $validated_data['pymt_declared'] == true){
            $validated_data['pymt_declared_datetime'] = now()->toDateTimeString();
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Asset buyer just declared their payment.'
            ]));
            session()->put('api_auth_user_username', $validated_data['updater_username']);
        }

        if (isset($validated_data['pymt_confirmed']) && $validated_data['pymt_confirmed'] == true){
            $validated_data['pymt_confirmed_datetime'] = now()->toDateTimeString();
            $validated_data['_status'] = 'active';
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Asset seller just confirmed receiving payment.'
            ]));
            session()->put('api_auth_user_username', $validated_data['updater_username']);

            // Unlock asset from escrow
            $seller_username = $element->was_offer_to == 'buy' ? $element->creator_username : $element->offer_creator_username;
            $buyer_username = $element->was_offer_to == 'sell' ? $element->creator_username : $element->offer_creator_username;
            
            $silent_lock_in_escrow = false;
            if ($silent_lock_in_escrow){
                $seller_asset_account = _AssetAccount::firstWhere([
                    'user_username' => $seller_username, 
                    'asset_code' => $element->asset_code,
                ]);
                (new _AssetAccountController)->update( new Request([
                    'asset_value' => $seller_asset_account->asset_value + $element->asset_value_escrowed
                ]), $seller_asset_account->id );

                $escrow_asset_account = _AssetAccount::firstWhere([
                    'user_username' => 'escrow',
                    'asset_code' => $element->asset_code,
                ]);
                (new _AssetAccountController)->update( new Request([
                    'asset_value' => $escrow_asset_account->asset_value - $element->asset_value_escrowed
                ]), $escrow_asset_account->id );
            } else {
                (new _TransactionController)->store( new Request([
                    'description' => 'Unlock asset from escrow for trade "' . $ref_code . '"',
                    'type' => 'escrow_asset_unlock',
                    'source_user_username' => 'escrow', 
                    'destination_user_username' => $seller_username, 
                    'asset_code' => $element->asset_code,
                    'transfer_value' => $element->asset_value_escrowed,
                ]));
            }
            sleep(1);
            // End unlock asset from escrow
            
            (new _TransactionController)->store( new Request([
                'description' => 'Asset release for trade "' . $ref_code . '"',
                'type' => 'trade_asset_release',
                'source_user_username' => $seller_username, 
                'destination_user_username' => $buyer_username, 
                'asset_code' => $element->asset_code,
                'transfer_value' => $element->asset_value,
                'platform_charge_asset_factor' => $element->platform_charge_asset_factor,
            ]));
        }

        if ( $element->_status == 'active' && ( isset($validated_data['pymt_declared_datetime']) || isset($element->pymt_declared_datetime) ) && ( isset($validated_data['pymt_confirmed_datetime']) || isset($element->pymt_confirmed_datetime) )){
            $validated_data['_status'] = 'completed';
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Trade has been marked as completed. Thank you for using our service.'
            ]));
            session()->put('api_auth_user_username', $validated_data['updater_username']);
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
            'entry_table' => $element->getTable(),
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
