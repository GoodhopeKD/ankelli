<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Stevebauman\Location\Facades\Location;

use App\Models\_Session;
use App\Http\Resources\_SessionResource;

use App\Models\_RegToken;
use App\Models\_EmailAddress;

use App\Models\_User;
use App\Http\Resources\_UserResource;

use App\Models\_PrefItem;

class __AuxController extends Controller
{
    /**
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function default_route(Request $request)
    {
        if ( _PrefItem::firstWhere('key_slug', 'scaffolding_app_enabled')->value_f() ){
            $request->validate([
                'active_session_data.token' => ['sometimes', 'string', 'min:16', 'max:16' ],
                'active_session_data.device_info' => ['required', 'array'],
                'active_session_data.agent_app_info' => ['required', 'array'],
                'active_session_data.utc_offset' => ['required', 'string', 'min:6', 'max:6'],
            ]);
        
            session()->put('utc_offset', $request->active_session_data['utc_offset']);
        
            // Response Structure
            $response = [
                //'sysconfig_params_data' => ( new __AuxController )->sysconfig_params()->getData()->data,
                //'datalists_data' => ( new __AuxController )->datalists()->getData(),
                'active_session_data' => null,
                'auth_user_data' => null,
            ];
        
            // Auth user
            $api_auth_user = auth('api')->user();
            if ( $api_auth_user){
                $response['auth_user_data'] = new _UserResource( $api_auth_user );
                session()->put('api_auth_user_username', $api_auth_user->username);
            }
        
            // Active session
            $active_session_data = $request->active_session_data;
            if ( $active_session_data){
                $active_session_data['request_location'] = Location::get() ? (array)(Location::get()) : [ 'ip' => $request->ip() ];
                if ( isset($active_session_data['token']) && _Session::where('token', $active_session_data['token'] )->exists() && _Session::find($active_session_data['token'])['_status'] !== 'ended' ){
                    $active_session_data['default_route'] = true;
                    $response['active_session_data'] = ( new _SessionController )->update( new Request( array_filter( $active_session_data) ), $active_session_data['token'] )->getData();
                } else {
                    $response['active_session_data'] = ( new _SessionController )->store( new Request( array_filter( $active_session_data) ) )->getData();
                }
            }
        
            return response()->json( $response );
        } else {
            return response()->json([
                'message' => 'Scaffolding app disabled',
            ]);
        }
    }

    public function platform_dashboard()
    {
        $platform_charge_stats_start_date = request()->platform_charge_stats_start_date;
        $platform_charge_stats = [
            'start_date' => now()->toDateTimeString(),
            'end_date' => now()->toDateTimeString(),
            'daily_totals' => [
                'USDT' => [
                    [ now()->toDateTimeString() => 100 ],
                ],
            ],
        ];
    }

    public function reserved_usernames()
    {
        return session()->get('active_session_token') == 'FACTORY_SSN' ? [] : ['ankelli', 'admin', 'system', 'root', 'user'];
    }

    public function availability_check(Request $request)
    {
        switch ($request->check_param_name) {
            case 'reg_token':
                $available = !_RegToken::where('token', $request->check_param_value )->exists();
                $message = $available ? 'Reg token available for use.' : 'Reg token already exists in database.';
                break;

            case 'username':
                $reserved_usernames = (new __AuxController)->reserved_usernames();
                $regex_passes = true;
                $regex_failed_username = '';
                foreach ($reserved_usernames as $reserved_username) {
                    if(preg_match("/{$reserved_username}/i", $request->check_param_value)) {
                        $regex_passes = false;
                        $regex_failed_username = $reserved_username;
                    }
                }
                $available = !_User::where('username', $request->check_param_value )->exists() && !in_array( $request->check_param_value , $reserved_usernames ) && $regex_passes;
                $message = $available ? 'Username available for use.' : ( in_array( $request->check_param_value , $reserved_usernames ) ? 'Chosen username is reserved word and can\'t be used.' : ( !$regex_passes ? 'Username contains "' . $regex_failed_username . '" which is a reserved word' : 'Username already in use in the system.' ) );
                break;

            case 'email_address':
                $available = !(_User::where('email_address', $request->check_param_value )->exists() || _EmailAddress::where('email_address', $request->check_param_value )->exists());
                $message = $available ? 'Email address available for use.' : 'Email address already exists in database.';
                break;
            
            default:
                $available = null;
                $message = 'Check param not recognized.';
                break;
        }

        $response = [
            "available" => $available,
            "message" => $message,
        ];
        return response()->json( $response );
    }

    public function usability_check(Request $request)
    {
        switch ($request->check_param_name) {
            case 'reg_token':
                $reg_token = _RegToken::find( $request->check_param_value );
                $usable = $reg_token && $reg_token->_status === 'usable' && count(_User::where('reg_token', $request->check_param_value)->get()) <= _PrefItem::firstWhere('key_slug', 'reg_token_max_use_count')->value_f();
                $message = $usable ? 'Reg token is usable.' : ($reg_token ? ($reg_token->_status === 'used_up' ? 'Reg token used up.' : 'Reg token has _status "'.$reg_token->_status.'".') : 'Reg token not found.');
                break;
            
            default:
                $usable = null;
                $message = 'Check param not recognized.';
                break;
        }

        $response = [
            "usable" => $usable,
            "message" => $message,
        ];
        return response()->json( $response );
    }

    public function sysconfig_params_enum_options()
    {
        return response()->json([
            'data' => [
                [
                    'slug' => 'langs',
                    'name' => 'Display Languages',
                    'options' => [
                        [
                            'slug' => 'en',
                            'name' => 'English',
                        ],
                        [
                            'slug' => 'fr',
                            'name' => 'French',
                        ],
                    ],
                ],
                [
                    'slug' => 'themes',
                    'name' => 'Display Themes',
                    'options' => [
                        [
                            'slug' => 'light',
                            'name' => 'Light',
                        ],
                        [
                            'slug' => 'dark',
                            'name' => 'Dark',
                        ],
                    ],
                ],
                [
                    'slug' => 'file_storage_drivers',
                    'name' => 'File Storage drivers',
                    'options' => [
                        [
                            'slug' => 'lavarel_file_storage',
                            'name' => 'Laravel file storage',
                        ],
                        [
                            'slug' => 'firebase_cloud_storage',
                            'name' => 'Firebase cloud storage',
                        ],
                    ],
                ],
                [
                    'slug' => 'db_drivers',
                    'name' => 'Database drivers',
                    'options' => [
                        [
                            'slug' => 'lavarel_mysql_db',
                            'name' => 'Laravel MYSQL Database',
                        ],
                        [
                            'slug' => 'firebase_cloud_firestore',
                            'name' => 'Firebase cloud firestore',
                        ],
                    ],
                ],
            ]
        ]);
    }

    public function sysconfig_params()
    {
        return response()->json( (new _PrefItemController)->index( new Request(['parent_uid' =>'system']) ));
    }

    public function datalists()
    {
        return response()->json([
            'active_assets' => json_decode((new _AssetController)->index( new Request(['_status' =>'active']) )->toJson(),true)['data'],
            'active_currencies' => json_decode((new _CurrencyController)->index( new Request(['_status' =>'active']) )->toJson(),true)['data'],
            'active_pymt_methods' => json_decode((new _PymtMethodController)->index( new Request(['_status' =>'active']) )->toJson(),true)['data'],
            'active_countries' => json_decode((new _CountryController)->index( new Request(['_status' =>'active']) )->toJson(),true)['data'],
        ]);
    }

    public function load_factory_data()
    {
        $clear_virtual_accounts = false;
        if ( $clear_virtual_accounts && _PrefItem::firstWhere('key_slug', 'use_tatum_crypto_asset_engine')->value_f() ){
            foreach ((new __TatumAPIController)->getVirtualAccounts(new Request())->getData() as $account) {
                (new __TatumAPIController)->deactivateVirtualAccount(new Request(['virtual_account_id' => $account->id]));
            }
        }

        $clear_subscriptions = true;
        if ( $clear_subscriptions && _PrefItem::firstWhere('key_slug', 'use_tatum_crypto_asset_engine')->value_f() ){
            foreach ((new __TatumAPIController)->getActiveSubscriptions(new Request())->getData() as $subscription) {
                (new __TatumAPIController)->cancelActiveSubscription(new Request(['subscription_id' => $subscription->id]));
            }
        }

        session()->put('active_session_token', 'FACTORY_SSN' );
        session()->put('api_auth_user_username', 'system');

        (new _AssetController)->store( new Request([
            'name' => 'Tether USD',
            'code' => 'USDT',
            'tatum_currency' => 'ETH',
            'smallest_display_unit' => 0.0001,
            'onchain_disclaimer' => "Our USDT is hosted on the Ethereum network.\nAll blockchain transactions should be handled accordingly."
        ]));

        $token_reg_changed = false;
        $token_reg_enabled_pref_item = _PrefItem::firstWhere('key_slug', 'token_reg_enabled');
        if ($token_reg_enabled_pref_item->value_f()){
            (new _PrefItemController)->update( new Request([
                'update_note' => 'Temporarily disabling for factory users.',
                'value' => false,
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
            $token_reg_changed = true;
        }
        
        // user:developer
        (new _UserController)->store( new Request([
            'username' => 'developer',
            'email_address' => 'developer.ankelli@gmail.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'developer',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store( new Request([
            'user_username' => 'developer',
            'post_title' => 'Default Developer',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'developer',
            'user_group_slug' => 'developers',
        ]));

        // user:sysadmin
        (new _UserController)->store( new Request([
            'username' => 'sysadmin',
            'email_address' => 'sysadmin@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'sysadmin',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store( new Request([
            'user_username' => 'sysadmin',
            'post_title' => 'Default System Administrator',
        ]));
        (new _BuyerExtensionController)->store( new Request([
            'user_username' => 'sysadmin',
            '_status' => 'deactivated',
        ]));
        (new _SellerExtensionController)->store( new Request([
            'user_username' => 'sysadmin',
            '_status' => 'deactivated',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'sysadmin',
            'user_group_slug' => 'system_administrators',
        ]));

        // user:reserves
        (new _UserController)->store( new Request([
            'username' => 'reserves',
            'email_address' => 'reserves@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetAccountController)->store( new Request([
            'asset_code' => 'USDT',
            'user_username' => 'reserves',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'reserves',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store( new Request([
            'user_username' => 'reserves',
            'post_title' => 'Ankelli Asset Reserves',
        ]));
        (new _BuyerExtensionController)->store( new Request([
            'user_username' => 'reserves',
            '_status' => 'deactivated',
        ]));
        (new _SellerExtensionController)->store( new Request([
            'user_username' => 'reserves',
            '_status' => 'deactivated',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'reserves',
            'user_group_slug' => 'business_administrators',
        ]));

        // user:busadmin
        (new _UserController)->store( new Request([
            'username' => 'busadmin',
            'email_address' => 'busadmin@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'busadmin',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store( new Request([
            'user_username' => 'busadmin',
            'post_title' => 'Default Business Administrator',
        ]));
        (new _BuyerExtensionController)->store( new Request([
            'user_username' => 'busadmin',
            '_status' => 'deactivated',
        ]));
        (new _SellerExtensionController)->store( new Request([
            'user_username' => 'busadmin',
            '_status' => 'deactivated',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'busadmin',
            'user_group_slug' => 'business_administrators',
        ]));

        // user:guddaz
        (new _UserController)->store( new Request([
            'username' => 'guddaz', 'email_address' => 'goodhopedhliwayo@gmail.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetAccountController)->store( new Request([
            'asset_code' => 'USDT',
            'user_username' => 'guddaz',
        ]));
        (new _AdminExtensionController)->store( new Request([
            'user_username' => 'guddaz', 'post_title' => 'Head System Developer',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'guddaz',
            'user_group_slug' => 'developers',
        ]));
        
        // user:paywyze
        (new _UserController)->store( new Request([
            'username' => 'paywyze', 'email_address' => 'paywyze@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetAccountController)->store( new Request([
            'asset_code' => 'USDT',
            'user_username' => 'paywyze',
        ]));
        (new _AdminExtensionController)->store( new Request([
            'user_username' => 'paywyze', 'post_title' => 'Head Business Administrator',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'paywyze', 'user_group_slug' => 'system_administrators',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'paywyze', 'user_group_slug' => 'user_administrators',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'paywyze', 'user_group_slug' => 'business_administrators',
        ]));

        // user:sekuru
        (new _UserController)->store( new Request([
            'username' => 'sekuru', 'email_address' => 'sekuru@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetAccountController)->store( new Request([
            'asset_code' => 'USDT',
            'user_username' => 'sekuru',
        ]));

        if ($token_reg_changed){
            (new _PrefItemController)->update( new Request([
                'update_note' => 'Resetting to default value.',
                'value' => $token_reg_enabled_pref_item->value_f(),
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
        }

        (new _RegTokenController)->store( new Request(['token' => '1234567890']));

        session()->forget('active_session_token');
        session()->forget('api_auth_user_username');
    }

    public function load_test_data()
    {
        session()->put('active_session_token', request()->segments()[env('API_URL')?0:1] );
        session()->put('api_auth_user_username', 'system');

        $token_reg_changed = false;
        $token_reg_enabled_pref_item = _PrefItem::firstWhere('key_slug', 'token_reg_enabled');
        if ($token_reg_enabled_pref_item->value_f()){
            (new _PrefItemController)->update( new Request([
                'update_note' => 'Temporarily disabling for test users.',
                'value' => false,
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
            $token_reg_changed = true;
        }

        $simple_users = ['ross', 'jimmy', 'keith', 'peter', 'flint', 'clarence', 'raymond', 'nassim'];

        foreach ($simple_users as $key => $username) {
            (new _UserController)->store( new Request([
                'username' => $username, 'email_address' => $username . '@example.com',
                'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
            ]));
        }

        // Internalisation transactions

        $internalisations = [
            ['reserves', 3000, 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9'],
            ['guddaz', 218.87587867, 'Transfer from Coinbase wallet to Ankelli wallet.', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D'],
            ['paywyze', 967.86579, 'Transfer from Ledger wallet to Ankelli wallet.', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D'],
            ['flint', 400, 'Transfer from Coinbase wallet to Ankelli wallet.', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9'],
            ['guddaz', 98.9012, 'Transfer from Exodus wallet to Ankelli wallet.', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9'],
            ['paywyze', 106.76, 'Transfer from Coinbase wallet to Ankelli wallet.', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9'],
        ];

        foreach ($internalisations as $key => $internalisation) {
            session()->put('api_auth_user_username', $internalisation[0]);
            (new _TransactionController)->store( new Request([
                'txcontext' => 'onchain',
                'blockchain_txid' => $internalisation[3],
                'description' => $internalisation[2],
                'operation_slug' => 'internalisation',
                'destination_user_username' => $internalisation[0], 
                'asset_code' => 'USDT',
                'transfer_asset_value' => $internalisation[1],
            ]));
            sleep(1);
        }

        // Deposit token transactioins,
        $deposit_tokeners = [
            ['ross', 110, 'USD', 111 ],
            ['keith', 600, 'USD', 601 ],
            ['jimmy', 500, 'USD', 501 ],
            ['clarence', 100, 'EUR', 93 ],
            ['nassim', 100, 'DZD', 18000 ],
        ];

        foreach ($deposit_tokeners as $key => $deposit_tokener) {
            // Deposit token -> transaction
            session()->put('api_auth_user_username', 'paywyze');
            $deposit_token = (new _DepositTokenController)->store( new Request([
                'asset_code' => 'USDT',
                'asset_value' => $deposit_tokener[1],
                'currency_code' => $deposit_tokener[2],
                'currency_amount' => $deposit_tokener[3],
            ]))->getData();
            session()->put('api_auth_user_username', $deposit_tokener[0]);
            (new _DepositTokenController)->use( new Request([ 'asset_code' => 'USDT' ]), $deposit_token->token );
            sleep(1);
        }
        

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'ross');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_purchase_amount' => 100,
            'max_purchase_amount' => 500,
            'pymt_method_slug' => 'mukuru',
            'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 7658 357' ],
        ]))->getData();
        session()->put('api_auth_user_username', 'guddaz');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I'm sending the cash in a couple of minutes."
        ]));
        sleep(1);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        sleep(1);
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I've sent the cash.\nPlease confirm receiving it."
        ]));
        sleep(1);
        session()->put('api_auth_user_username', 'ross');
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I've collected the money."
        ]));
        sleep(1);
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "Pleasure doing business with you."
        ]));
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123' ]), $trade->ref_code );
        sleep(1);

        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zimbabwe',
            'location' => 'Norton', 
            'offer_to' => 'sell',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 1.04,
            'min_sell_value' => 50,
            'max_sell_value' => 200,
            'pymt_method_slug' => 'cash_in_person',
        ]))->getData();


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'raymond');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.95,
            'min_purchase_amount' => 100,
            'max_purchase_amount' => 500,
            'pymt_method_slug' => 'world_remit',
            'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 765 357',],
        ]))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'source_user_password' => 'Def-Pass#123']))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'raymond');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'keith');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_purchase_amount' => 100,
            'max_purchase_amount' => 500,
            'pymt_method_slug' => 'paypal',
            'pymt_details' => [ 'fullname' => 'Tawanda Chakatsva', 'email_address' => 'tawanda@example.com', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 140, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'keith');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'jimmy');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zambia',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_purchase_amount' => 100,
            'max_purchase_amount' => 1000,
            'pymt_method_slug' => 'skrill',
            'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'email_address' => 'mulenga@example.com', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 600, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'jimmy');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'clarence');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zambia',
            'location' => 'Lusaka CBD', 
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_purchase_amount' => 100,
            'max_purchase_amount' => 1000,
            'pymt_method_slug' => 'cash_in_person',
            'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'phone_no' => 'mulenga@example.com', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'ross');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'clarence');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'paywyze');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zambia',
            'location' => 'Lusaka CBD', 
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'ZMW',
            'offer_price' => 13.3,
            'min_purchase_amount' => 2800,
            'max_purchase_amount' => 14000,
            'pymt_method_slug' => 'cash_in_person',
            'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'phone_no' => 'mulenga@example.com', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 2800, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'paywyze');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'peter');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_purchase_amount' => 200,
            'max_purchase_amount' => 300,
            'pymt_method_slug' => 'fbc_bank',
            'pymt_details' => [ 'fullname' => 'Tadiwa Magodi', 'account_no' => '556788965445', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 250, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'peter');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'flint');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'South Africa',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'ZAR',
            'offer_price' => 15.36,
            'min_purchase_amount' => 1500,
            'max_purchase_amount' => 2500,
            'pymt_method_slug' => 'fnb_bank',
            'pymt_details' => [ 'fullname' => 'William Mbeki', 'account_no' => '6557890898', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 2500, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'flint');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'paywyze');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'South Africa',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'ZAR',
            'offer_price' => 15.2,
            'min_purchase_amount' => 700,
            'max_purchase_amount' => 3000,
            'pymt_method_slug' => 'fnb_bank',
            'pymt_details' => [ 'fullname' => 'William Mbeki', 'account_no' => '6557890898', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 2800, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'paywyze');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'raymond');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Italy',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'EUR',
            'offer_price' => 0.76,
            'min_purchase_amount' => 200,
            'max_purchase_amount' => 500,
            'pymt_method_slug' => 'world_remit',
            'pymt_details' => [ 'fullname' => 'Panashe Gabvu', 'phone_no' => '+78 568 6553', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'raymond');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'nassim');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Algeria',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'DZD',
            'offer_price' => 178,
            'min_purchase_amount' => 10000,
            'max_purchase_amount' => 40000,
            'pymt_method_slug' => 'algerie_poste',
            'pymt_details' => [ 'account_holder_name' => 'Djenna Moulad', 'account_no' => '22657899', 'account_key' => '67', ],
        ]))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 36000, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'nassim');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Zimbabwe',
            'location' => 'Marondera', 
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_purchase_amount' => 100,
            'max_purchase_amount' => 200,
            'pymt_method_slug' => 'cash_in_person',
            'pymt_details' => [ 'fullname' => 'Tamari Karongo', 'address' => 'Opposite OK Marondera', 'phone_no' => '+263 7658 357' ],
        ]))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'guddaz');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'peter');
        $offer = (new _OfferController)->store( new Request([
            'country_name' => 'Algeria',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'DZD',
            'offer_price' => 170,
            'min_purchase_amount' => 20000,
            'max_purchase_amount' => 40000,
            'pymt_method_slug' => 'algerie_poste',
            'pymt_details' => [ 'account_holder_name' => 'Timothy Tambo', 'account_number' => '22558678', 'account_key' => '87' ],
        ]))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store( new Request([ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 35000, 'source_user_password' => 'Def-Pass#123' ]))->getData();
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', 'peter');
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'source_user_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(1);

        if ($token_reg_changed){
            (new _PrefItemController)->update( new Request([
                'update_note' => 'Resetting to default value.',
                'value' => $token_reg_enabled_pref_item->value_f(),
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
        }

        session()->forget('active_session_token');
        session()->forget('api_auth_user_username');
    }
}