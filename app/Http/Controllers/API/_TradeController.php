<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;

use App\Models\_BuyerExtension;
use App\Models\_SellerExtension;
use App\Models\_AssetWallet;
use App\Models\_PrefItem;
use App\Models\_User;
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
            'sender_password' => ['sometimes', 'string', 'min:8', 'max:32'],
            'pymt_details' => ['sometimes', 'array'],
            'pymt_details.physical_address' => ['sometimes', 'string', 'max:255'],
            'pymt_details.email_address' => ['sometimes', 'string', 'email', 'max:64'],
            'pymt_details.fullname' => ['sometimes', 'string', 'max:255'],
            'pymt_details.account_holder_name' => ['sometimes', 'string', 'max:128'],
            'pymt_details.account_no' => ['sometimes', 'string', 'max:64'],
            'pymt_details.account_key' => ['sometimes', 'string', 'max:8'],
            'pymt_details.phone_no' => ['sometimes', 'string', 'max:64'],
        ]);

        $offer = _Offer::findOrFail($validated_data['offer_ref_code'])->makeVisible(['pymt_details']);

        if ($offer->_status =='offline'){
            return abort(422, 'Offer is offline and trade cannot be created');
        }

        $api_auth_user_username = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $validated_data['trade_txn_fee_fctr'] = $offer->trade_txn_fee_fctr ?? _PrefItem::firstWhere('key_slug', 'trade_txn_fee_fctr')->value_f();
        $validated_data['asset_value'] = $validated_data['currency_amount'] / $offer->offer_price;
        $validated_data['asset_value_escrowed'] = $validated_data['asset_value'] * (1 + $validated_data['trade_txn_fee_fctr']);

        if ($offer->offer_to == 'buy'){
            if (!($validated_data['currency_amount'] >= $offer->min_trade_purchase_amount && $validated_data['currency_amount'] <= $offer->max_trade_purchase_amount)){
                return abort(422, 'Amount not within limits.');
            }
            if (isset($validated_data['sender_password'])){
                if (!Hash::check($validated_data['sender_password'], _User::firstWhere('username', $api_auth_user_username)->makeVisible(['password'])->password)) {
                    return abort(422, 'Password incorrect');
                }
            } else {
                return abort(403, 'Source user password required to authorize trade transaction');
            }
        } else {
            if (!($validated_data['asset_value_escrowed'] >= $offer->min_trade_sell_value && $validated_data['asset_value_escrowed'] <= $offer->max_trade_sell_value)){
                return abort(422, 'Asset Value not within limits.');
            }
        }
        $validated_data = array_filter( array_merge( $offer->toArray() , [ '_status' => null ], $validated_data ) );
        $validated_data['creator_username'] = $api_auth_user_username;

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
                    'update_note' => 'Set offline by the system because _SellerExtension is '.$seller_seller_extension->_status
                ]), $offer->ref_code );
                session()->put('api_auth_user_username', $api_auth_user_username);
                return abort(422,"Selected seller cannot sell because _SellerExtension is ".$seller_seller_extension->_status);
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
                    'update_note' => 'Set offline by the system because _BuyerExtension is '.$buyer_buyer_extension->_status
                ]), $offer->ref_code );
                session()->put('api_auth_user_username', $api_auth_user_username);
                return abort(422,"Selected buyer cannot buy because _BuyerExtension is ".$buyer_buyer_extension->_status);
            }
        } else {
            (new _BuyerExtensionController)->store( new Request([ 'user_username' => $buyer_username ]));
        }

        // Lock seller asset in escrow
        $seller_asset_wallet = _AssetWallet::firstWhere([
            'user_username' => $seller_username,
            'asset_code' => $offer->asset_code
        ]);

        if ( !$seller_asset_wallet ){ return abort(422, 'Current '.$offer->asset_code.' balance insufficient for transaction.'); }
        if ( $seller_asset_wallet->_status == 'frozen' ){ return abort(422, 'Selected asset is frozen.'); }

        $validated_data['was_offer_to'] = $offer->offer_to;
        $validated_data['offer_creator_username'] = $offer->creator_username;
        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $seller_new_usable_balance_asset_value = $seller_asset_wallet->usable_balance_asset_value - $validated_data['asset_value_escrowed'];

        if ( $seller_new_usable_balance_asset_value < 0 ){ return abort(422, 'Current '.$offer->asset_code.' balance insufficient for transaction.'); }
        $tatum_element = (new _AssetWalletController)->blockAssetValue( new Request([
            'asset_value' => $validated_data['asset_value_escrowed'],
            'blockage_type_slug' => 'trade_escrow',
        ]), $seller_asset_wallet->id )->getData();
        if ( _PrefItem::firstWhere('key_slug', 'use_tatum_api')->value_f() ){
            $validated_data['tatum_amount_blockage_id'] = $tatum_element->id;
        }
        // End lock in escrow

        // Update fill
        $update_limits = true;
        session()->put('api_auth_user_username', 'system');
        $offer_update_data = [
            'update_note' => 'Updating fill',
        ];
        if ($offer->offer_to == 'buy'){
            $offer_update_data['filled_amount'] = $offer->filled_amount + $validated_data['currency_amount'];
            $offer_update_data['max_trade_purchase_amount'] = $offer->max_trade_purchase_amount;
            $remaining_offer_total_purchase_amount = $offer->offer_total_purchase_amount - $offer_update_data['filled_amount'];
            if ($remaining_offer_total_purchase_amount < $offer_update_data['max_trade_purchase_amount']){
                $offer_update_data['max_trade_purchase_amount'] = $remaining_offer_total_purchase_amount;
            }
            if ($offer_update_data['max_trade_purchase_amount'] < $offer->min_trade_purchase_amount){
                $update_limits = false;
            }
        } else {
            $offer_update_data['filled_value'] = $offer->filled_value + $validated_data['asset_value'];
            $offer_update_data['max_trade_sell_value'] = $offer->max_trade_sell_value;
            $remaining_offer_total_sell_value = $offer->offer_total_sell_value - $offer_update_data['filled_value'];
            if ($remaining_offer_total_sell_value < $offer_update_data['max_trade_sell_value']){
                $offer_update_data['max_trade_sell_value'] = $remaining_offer_total_sell_value;
            }
            if ($offer_update_data['max_trade_sell_value'] < $offer->min_trade_sell_value){
                $update_limits = false;
            }
        }
        if ($update_limits){
            (new _OfferController)->update(new Request($offer_update_data), $offer->ref_code );
        } else {
            (new _OfferController)->update(new Request( array_filter( array_merge($offer_update_data, [
                'max_trade_purchase_amount' => null,
                'max_trade_sell_value' => null,
                '_status' => 'offline', 
                'update_note' => 'Set offline by the system because maximum per trade is now less than minimum',
            ]))), $offer->ref_code );
        }
        session()->put('api_auth_user_username', $api_auth_user_username);
        // End Update fill

        $element = _Trade::create($validated_data);

        // Create notification
        (new _NotificationController)->store( new Request([
            'user_username' => $validated_data['offer_creator_username'],
            'content' => [
                'title' => 'Trade initialized',
                'subtitle' => 'Someone accepted your offer ref: '.$validated_data['offer_ref_code'].' for asset value '.$validated_data['asset_value'].' '.$validated_data['asset_code'],
                'body' => 'Your offer '.$validated_data['offer_ref_code'].' has been accepted. Trade '.$validated_data['ref_code'].' initialized for asset value '.$validated_data['asset_value'].' '.$validated_data['asset_code'],
            ],
        ]));
        // End Create notification

        // Create message
        session()->put('api_auth_user_username', 'system');
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $element->ref_code,
            'body' => 'Trade has been initialized. Use this chat space to communicate with trade peer.'
        ]));
        session()->put('api_auth_user_username', $api_auth_user_username);
        // End Create message
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Trade entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->ref_code,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _TradeResource( $element ) );
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
        if (!$element) return abort(404, 'Trade with specified reference code not found');
        if (!$element->buyer_opened_datetime){
            $api_auth_user_username = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
            if (($element->was_offer_to === 'buy' && $api_auth_user_username == $element->offer_creator_username) || ($element->was_offer_to === 'sell' && $api_auth_user_username == $element->creator_username)){
                $validated_data['buyer_opened_datetime'] = now()->toDateTimeString();
                $element->update($validated_data);
            }
        }
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
            'sender_password' => ['sometimes', 'string', 'min:8', 'max:32'],
            'visible_to_creator' => ['sometimes', 'boolean'],
            'visible_to_offer_creator' => ['sometimes', 'boolean'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'cancelled', 'flagged'])],
        ]);

        $element = _Trade::findOrFail($ref_code);
        $trade_was_cancelled = $element->_status == 'cancelled';

        if ( $trade_was_cancelled ){
            $new_validated_data = [];
            if (isset($validated_data['visible_to_creator'])) $new_validated_data['visible_to_creator'] = $validated_data['visible_to_creator'];
            if (isset($validated_data['visible_to_offer_creator'])) $new_validated_data['visible_to_offer_creator'] = $validated_data['visible_to_offer_creator'];
            if (!count($new_validated_data)) return abort(422, 'Trade was cancelled and no further action can be taken.');
            $validated_data = $new_validated_data;
        }

        $api_auth_user_username = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['updater_username'] = $api_auth_user_username;
        
        if (isset($validated_data['pymt_declared']) && $validated_data['pymt_declared'] == true){
            $validated_data['pymt_declared_datetime'] = now()->toDateTimeString();
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Asset buyer just declared their payment.'
            ]));
            session()->put('api_auth_user_username', $api_auth_user_username);
        }

        $seller_username = $element->was_offer_to == 'buy' ? $element->creator_username : $element->offer_creator_username;
        $buyer_username = $element->was_offer_to == 'sell' ? $element->creator_username : $element->offer_creator_username;

        if ( isset($validated_data['_status']) && $validated_data['_status'] === 'flagged' ){
            $validated_data['flag_raiser_username'] = $validated_data['updater_username'];
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Trade has been flagged by the '.($validated_data['flag_raiser_username']==$seller_username ? 'seller' : 'buyer').'. Moderators will respond shortly.'
            ]));
            session()->put('api_auth_user_username', $api_auth_user_username);
        }

        if ( isset($validated_data['_status']) && $validated_data['_status'] === 'active' && $element->_status == 'flagged' ){
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Trade has been unflagged. We hope the problem has been resolved.'
            ]));
            session()->put('api_auth_user_username', $api_auth_user_username);
        }

        if ( isset($validated_data['_status']) && $validated_data['_status'] === 'flagged' ){
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Trade has been flagged. Moderators will respond shortly'
            ]));
            session()->put('api_auth_user_username', $api_auth_user_username);
        }

        if ( isset($validated_data['_status']) && $validated_data['_status'] === 'cancelled' ){
            if ( $seller_username === $validated_data['updater_username']){
                $buyer_open_trade_min_mins_tmt = _PrefItem::firstWhere('key_slug', 'buyer_open_trade_min_mins_tmt')->value_f();
                if ( $element->buyer_opened_datetime !== null || ((new Carbon($element->created_datetime))->addMinutes($buyer_open_trade_min_mins_tmt))->gt(now()->toDateTimeString()) ){
                    return abort(422, 'Seller not allowed to cancel trade if buyer has opened it before the elapse of '.$buyer_open_trade_min_mins_tmt.' minutes.');
                }
            }
            
            if ( in_array($validated_data['updater_username'], [$buyer_username, $seller_username, 'system']) ){
                $trade_was_cancelled = true;
                $validated_data['closed_datetime'] = now()->toDateTimeString();
                // Unlock asset from escrow
                $seller_asset_wallet = _AssetWallet::firstWhere([
                    'user_username' => $seller_username,
                    'asset_code' => $element->asset_code,
                ]);
                (new _AssetWalletController)->unblockAssetValue( new Request([
                    'asset_value' => $element->asset_value_escrowed,
                    'tatum_amount_blockage_id' => $element->tatum_amount_blockage_id,
                ]), $seller_asset_wallet->id );
                // End unlock asset from escrow

                // Update fill
                session()->put('api_auth_user_username', 'system');
                $offer = _Offer::findOrFail($element->offer_ref_code);
                $offer_update_data = [
                    'update_note' => 'Updating fill',
                ];
                if ($offer->offer_to == 'buy'){
                    $offer_update_data['filled_amount'] = $offer->filled_amount - $element->currency_amount;
                } else {
                    $offer_update_data['filled_value'] = $offer->filled_value - $element->asset_value;
                }
                (new _OfferController)->update(new Request($offer_update_data), $offer->ref_code );
                session()->put('api_auth_user_username', $api_auth_user_username);
                // End Update fill

            } else {
                return abort(422, 'Current user not allowed to cancel trade.');
            }
        }

        if ( !$trade_was_cancelled && isset($validated_data['pymt_confirmed']) && $validated_data['pymt_confirmed'] == true){

            if (isset($validated_data['sender_password'])){
                if (!Hash::check($validated_data['sender_password'], _User::firstWhere('username', session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null ))->makeVisible(['password'])->password)) {
                    return abort(422, 'Password incorrect');
                }
            } else {
                return abort(403, 'Source user password required to authorize trade transaction');
            }

            $validated_data['pymt_confirmed_datetime'] = now()->toDateTimeString();
            $validated_data['_status'] = 'active';
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Asset seller just confirmed receiving payment.'
            ]));
            session()->put('api_auth_user_username', $api_auth_user_username);

            // Unlock asset from escrow
            $seller_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $seller_username,
                'asset_code' => $element->asset_code,
            ]);
            (new _AssetWalletController)->unblockAssetValue( new Request([
                'asset_value' => $element->asset_value_escrowed,
                'tatum_amount_blockage_id' => $element->tatum_amount_blockage_id,
            ]), $seller_asset_wallet->id );
            usleep(500);
            // End unlock asset from escrow
            
            (new _TransactionController)->store( new Request([
                'txn_context' => 'offchain',
                'operation_slug' => 'trade_asset_release',
                'sender_username' => $seller_username, 
                'sender_password' => $validated_data['sender_password'],
                'sender_note' => 'Outbound asset release for trade '.$ref_code,
                'recipient_username' => $buyer_username,
                'recipient_note' => 'Inbound asset release for trade '.$ref_code,
                'asset_code' => $element->asset_code,
                'xfer_asset_value' => $element->asset_value,
                'txn_fee_fctr' => $element->trade_txn_fee_fctr,
            ]));
        }

        if ( ($element->_status == 'active' || ($element->_status == 'flagged' && isset($validated_data['_status']) && $validated_data['_status'] === 'active' && in_array($validated_data['updater_username'], [$element->flag_raiser_username]) )) && ( isset($validated_data['pymt_declared_datetime']) || isset($element->pymt_declared_datetime) ) && ( isset($validated_data['pymt_confirmed_datetime']) || isset($element->pymt_confirmed_datetime) )){
            $validated_data['_status'] = 'completed';
            $validated_data['closed_datetime'] = now()->toDateTimeString();
        }
        
        if ( $element->_status == 'active' && ( isset($validated_data['pymt_declared_datetime']) || isset($element->pymt_declared_datetime) ) && ( isset($validated_data['pymt_confirmed_datetime']) || isset($element->pymt_confirmed_datetime) )){
            session()->put('api_auth_user_username', 'system');
            (new _MessageController)->store( new Request([
                'parent_table' => '__trades',
                'parent_uid' => $element->ref_code,
                'body' => 'Trade has been marked as completed. Thank you for using our service.'
            ]));
            session()->put('api_auth_user_username', $api_auth_user_username);
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

        if ($request->expectsJson()) return response()->json( new _TradeResource( $element ) );
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
