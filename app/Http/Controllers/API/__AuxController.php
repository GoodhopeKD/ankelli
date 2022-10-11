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
                'active_session_data.token' => ['sometimes', 'string', 'size:16' ],
                'active_session_data.device_info' => ['required', 'array'],
                'active_session_data.agent_app_info' => ['required', 'array'],
                'active_session_data.utc_offset' => ['required', 'string', 'size:6'],
            ]);
        
            session()->put('utc_offset', $request->active_session_data['utc_offset']);
        
            // Response Structure
            $response = [
                'sysconfig_params_data' => ( new __AuxController )->sysconfig_params()->getData()->data,
                'datalists_data' => ( new __AuxController )->datalists()->getData(),
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
        $txn_fee_stats_start_date = request()->txn_fee_stats_start_date;
        $txn_fee_stats = [
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
        switch ($request->param_name) {
            case 'reg_token':
                $available = !_RegToken::where('token', $request->param_value )->exists();
                $message = $available ? 'Reg token available for use.' : 'Reg token already exists in database.';
                break;

            case 'username':
                $reserved_usernames = (new __AuxController)->reserved_usernames();
                $regex_passes = true;
                $regex_failed_username = '';
                foreach ($reserved_usernames as $reserved_username) {
                    if(preg_match("/{$reserved_username}/i", $request->param_value)) {
                        $regex_passes = false;
                        $regex_failed_username = $reserved_username;
                    }
                }
                $available = !_User::where('username', $request->param_value )->exists() && !in_array( $request->param_value , $reserved_usernames ) && $regex_passes;
                $message = $available ? 'Username available for use.' : ( in_array( $request->param_value , $reserved_usernames ) ? 'Chosen username is reserved word and can\'t be used.' : ( !$regex_passes ? 'Username contains "'.$regex_failed_username.'" which is a reserved word' : 'Username already in use in the system.' ) );
                break;

            case 'email_address':
                $available = !(_User::where('email_address', $request->param_value )->exists() || _EmailAddress::where('email_address', $request->param_value )->exists());
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
        switch ($request->param_name) {
            case 'reg_token':
                $reg_token = _RegToken::find( $request->param_value );
                $usable = $reg_token && $reg_token->_status === 'usable' && count(_User::where('reg_token', $request->param_value)->get()) <= _PrefItem::firstWhere('key_slug', 'reg_token_max_use_count')->value_f();
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
        $use_ttm_api = _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f();
        $clear_unsigned_transactions = true;
        if ( $clear_unsigned_transactions && $use_ttm_api ){
            foreach ((new Tatum\Security\KMSController)->ReceivePendingTransactionsToSign(new Request(['chain' => 'ETH']))->getData() as $transaction) {
                (new Tatum\Security\KMSController)->DeletePendingTransactionToSign(new Request(['id' => $transaction->id]));
            }
        }

        $clear_virtual_accounts = false;
        if ( $clear_virtual_accounts && $use_ttm_api ){
            foreach ((new Tatum\VirtualAccounts\AccountController)->getAccounts(new Request())->getData() as $account) {
                try { (new Tatum\VirtualAccounts\AccountController)->deactivateAccount(new Request(['id' => $account->id])); } catch (\Throwable $th) {}
            }
        }

        $clear_notification_webhook_subscriptions = true;
        if ( $clear_notification_webhook_subscriptions && $use_ttm_api ){
            foreach ((new Tatum\Subscriptions\NotificationSubscriptionController)->getSubscriptions(new Request())->getData() as $subscription) {
                (new Tatum\Subscriptions\NotificationSubscriptionController)->deleteSubscription(new Request(['id' => $subscription->id]));
            }
            (new Tatum\Subscriptions\NotificationSubscriptionController)->createSubscription(new Request([
                'type' => 'KMS_COMPLETED_TX',
                'attr' => [
                    'url' => "https://api.ankelli.com/webhooks/tatum/nofitications/completed-kms-transaction",
                ],
            ]));
            (new Tatum\Subscriptions\NotificationSubscriptionController)->createSubscription(new Request([
                'type' => 'KMS_FAILED_TX',
                'attr' => [
                    'url' => "https://api.ankelli.com/webhooks/tatum/nofitications/failed-kms-transaction",
                ],
            ]));
        }

        session()->put('active_session_token', 'FACTORY_SSN' );
        session()->put('api_auth_user_username', 'system');

        $factory_asset_code = 'ETH';
        $factory_asset_chain = 'ETH';
        $created_asset = null;

        if ($factory_asset_code === 'ETH'){
            $created_asset = (new _AssetController)->store( Request::create('','',[
                'name' => 'Ethereum',
                'code' => 'ETH',
                'chain' => 'ETH',
                'mnemonic' => 'again gospel obtain verify purchase insane hazard invest chicken lemon mother spring move tackle meat novel silk attack desk item anger scatter beef talent',
                'smallest_display_unit' => '0.0000000001',
                'withdrawal_txn_fee_usd_fctr' => 1,
                'payment_txn_fee_usd_fctr' => 1,
                'usd_asset_exchange_rate' => '0.00076',
                'onchain_disclaimer' => "This platform is still in test mode on the sepolia testnet chain.
Onchain transactions should be handled accordingly."
            ],[],[],['HTTP_accept'=>'application/json']))->getData();
        }

        if ($factory_asset_code === 'USDT'){
            $created_asset = (new _AssetController)->store( Request::create('','',[
                'name' => 'Tether USD',
                'code' => 'USDT',
                'chain' => 'ETH',
                'mnemonic' => 'again gospel obtain verify purchase insane hazard invest chicken lemon mother spring move tackle meat novel silk attack desk item anger scatter beef talent',
                'smallest_display_unit' => '0.00001',
                'withdrawal_txn_fee_usd_fctr' => 1,
                'payment_txn_fee_usd_fctr' => 1,
                'usd_asset_exchange_rate' => 1,
                'onchain_disclaimer' => "This platform is still in test mode using the testnet chain.
USDT doesn't exist on testnet so we're using ETH but referring to it here as USDT.
The system does an internal conversion such that 1 ETH = 1000 USDT.
Handle all internal transactions normally but know that these values will be reflected differently outside this platform."
            ],[],[],['HTTP_accept'=>'application/json']))->getData();
        }

        if ( $use_ttm_api ){
            (new _AssetController)->updateRate($created_asset->id);
        }

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

        // user:busops // used for collecting platform fees and deposit token topups
        (new _UserController)->store( new Request([
            'username' => 'busops',
            'email_address' => 'busops@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetWalletController)->store( new Request([
            'asset_code' => $factory_asset_code,
            'asset_chain' => $factory_asset_chain,
            'user_username' => 'busops',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'busops',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store( new Request([
            'user_username' => 'busops',
            'post_title' => 'Ankelli Asset Reserves',
        ]));
        (new _BuyerExtensionController)->store( new Request([
            'user_username' => 'busops',
            '_status' => 'deactivated',
        ]));
        (new _SellerExtensionController)->store( new Request([
            'user_username' => 'busops',
            '_status' => 'deactivated',
        ]));
        (new _UserGroupMembershipController)->store( new Request([
            'user_username' => 'busops',
            'user_group_slug' => 'business_administrators',
        ]));

        // user:guddaz
        (new _UserController)->store( new Request([
            'username' => 'guddaz', 'email_address' => 'goodhopedhliwayo@gmail.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetWalletController)->store( new Request([
            'asset_code' => $factory_asset_code,
            'asset_chain' => $factory_asset_chain,
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
        (new _AssetWalletController)->store( new Request([
            'asset_code' => $factory_asset_code,
            'asset_chain' => $factory_asset_chain,
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

        // user:john_doe
        (new _UserController)->store( new Request([
            'username' => 'john_doe', 'email_address' => 'john_doe@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetWalletController)->store( new Request([
            'asset_code' => $factory_asset_code,
            'asset_chain' => $factory_asset_chain,
            'user_username' => 'john_doe',
        ]));

        // user:mark
        (new _UserController)->store( new Request([
            'username' => 'mark', 'email_address' => 'mark@ankelli.com',
            'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
        ]));
        (new _AssetWalletController)->store( new Request([
            'asset_code' => $factory_asset_code,
            'asset_chain' => $factory_asset_chain,
            'user_username' => 'mark',
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
        if (_PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f()){
            return;
        }

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
                'username' => $username, 'email_address' => $username.'@example.com',
                'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
            ]));
        }

        // Internalisation transactions

        $internalisations = [
            ['busops', 3000, 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9'],
            ['guddaz', 248.87587867, 'Transfer from Coinbase wallet to Ankelli wallet.', '62BD544D1B9031EFC300A3E850CC3A0D51CA5131450C1AB3BCAC6D243F65460D'],
            ['paywyze', 967.86579, 'Transfer from Ledger wallet to Ankelli wallet.', '62BD544D1B9031EFC300A3E850CC3A0D51CA5131450C1AB3BCAC6D243F65s60D'],
            ['flint', 498.6678, 'Transfer from Coinbase wallet to Ankelli wallet.', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bcd'],
            ['guddaz', 198.9012, 'Transfer from Exodus wallet to Ankelli wallet.', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314f6748eb0e9bc9'],
            ['paywyze', 146.76, 'Transfer from Coinbase wallet to Ankelli wallet.', 'c83f8818db43d9be4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9'],
        ];

        foreach ($internalisations as $key => $internalisation) {
            session()->put('api_auth_user_username', $internalisation[0]);
            (new _TransactionController)->store( new Request([
                'txn_context' => 'onchain',
                'blockchain_txn_id' => $internalisation[3],
                'recipient_note' => $internalisation[2],
                'operation_slug' => 'DEPOSIT',
                'recipient_username' => $internalisation[0], 
                'asset_code' => 'USDT',
                'xfer_asset_value' => $internalisation[1],
            ]));
            sleep(3);
        }

        // Deposit token transactioins,
        $deposit_tokeners = [
            ['ross', 250, 'USD', 251 ],
            ['keith', 650, 'USD', 651 ],
            ['jimmy', 500, 'USD', 501 ],
            ['clarence', 190, 'EUR', 191 ],
            ['nassim', 200, 'DZD', 42000 ],
        ];

        foreach ($deposit_tokeners as $key => $deposit_tokener) {
            // Deposit token -> transaction
            session()->put('api_auth_user_username', 'paywyze');
            $deposit_token = (new _DepositTokenController)->store( Request::create('','',[
                'asset_code' => 'USDT',
                'asset_value' => $deposit_tokener[1],
                'currency_code' => $deposit_tokener[2],
                'currency_amount' => $deposit_tokener[3],
            ],[],[],['HTTP_accept'=>'application/json']))->getData();
            session()->put('api_auth_user_username', $deposit_tokener[0]);
            (new _DepositTokenController)->use( $deposit_token->token, 'USDT' );
            sleep(3);
        }
        

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'ross');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'mukuru',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'guddaz');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 7658 357' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I'm sending the cash in a couple of minutes."
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        sleep(3);
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I've sent the cash.\nPlease confirm receiving it."
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I've collected the money."
        ]));
        sleep(3);
        (new _MessageController)->store( new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "Pleasure doing business with you."
        ]));
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123' ]), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
            'comment' => 'Quick trade. Buyer was very responsive.'
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
            'comment' => 'Seller ensured a fast trade.',
        ]));
        sleep(3);

        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'location' => 'Norton', 
            'offer_to' => 'sell',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'min_trade_sell_value' => 50/0.94,
            'max_trade_sell_value' => 200/0.94,
            'offer_total_sell_value' => 201/0.94,
            'pymt_method_slug' => 'cash_in_person',
            'pymt_details' => [ 'phone_no' => '+263 7658 357' ],
        ],[],[],['HTTP_accept'=>'application/json']))->getData();


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'raymond');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.95,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'world_remit',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 765 357' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(3);


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'keith');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'paypal',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 150, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Tawanda Chakatsva', 'email_address' => 'tawanda@example.com' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'jimmy');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zambia',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 1000,
            'offer_total_purchase_amount' => 1000,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'skrill',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 600, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'email_address' => 'mulenga@example.com' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'clarence');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zambia',
            'location' => 'Lusaka CBD', 
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 1000,
            'offer_total_purchase_amount' => 1000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'cash_in_person',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'ross');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'phone_no' => 'mulenga@example.com', ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'paywyze');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zambia',
            'location' => 'Lusaka CBD', 
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'ZMW',
            'offer_price' => 13.3,
            'min_trade_purchase_amount' => 2000,
            'max_trade_purchase_amount' => 15000,
            'offer_total_purchase_amount' => 20000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'cash_in_person',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 3000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'phone_no' => 'mulenga@example.com', ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'peter');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 200,
            'max_trade_purchase_amount' => 300,
            'offer_total_purchase_amount' => 300,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'fbc_bank',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 250, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Tadiwa Magodi', 'account_no' => '506788965445' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'flint');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'South Africa',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'ZAR',
            'offer_price' => 16.92,
            'min_trade_purchase_amount' => 1000,
            'max_trade_purchase_amount' => 2500,
            'offer_total_purchase_amount' => 2500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'fnb_bank',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 2500, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'William Mbeki', 'account_no' => '6507890898', ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'paywyze');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'South Africa',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'ZAR',
            'offer_price' => 17.02,
            'min_trade_purchase_amount' => 500,
            'max_trade_purchase_amount' => 3000,
            'offer_total_purchase_amount' => 3000,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'fnb_bank',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 3000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'William Mbeki', 'account_no' => '6507890898' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'raymond');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Italy',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'EUR',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 200,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'world_remit'
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Panashe Gabvu', 'phone_no' => '+78 568 6503', ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'nassim');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Algeria',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'DZD',
            'offer_price' => 200,
            'min_trade_purchase_amount' => 10000,
            'max_trade_purchase_amount' => 40000,
            'offer_total_purchase_amount' => 40000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'algerie_poste',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 35000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'account_holder_name' => 'Djenna Moulad', 'account_no' => '22657899', 'account_key' => '67', ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'location' => 'Marondera', 
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 50,
            'max_trade_purchase_amount' => 200,
            'offer_total_purchase_amount' => 200,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'cash_in_person'
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 150, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Tamari Karongo', 'address' => 'Opposite OK Marondera', 'phone_no' => '+263 7658 357' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);

        // Trade -> transaction
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 50, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Samuel Kaviya', 'phone_no' => '+263 772 234 677' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'peter');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Algeria',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'DZD',
            'offer_price' => 195,
            'min_trade_purchase_amount' => 20000,
            'max_trade_purchase_amount' => 40000,
            'offer_total_purchase_amount' => 40000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'algerie_poste',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 36000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'account_holder_name' => 'Timothy Tambo', 'account_number' => '22508678', 'account_key' => '87' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->update( new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code );
        sleep(3);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store( new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(3);

        // Offer -> trade
        session()->put('api_auth_user_username', 'raymond');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 100,
            'offer_total_purchase_amount' => 100,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'mukuru',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'guddaz');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 765 357' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        sleep(3);
        (new _TradeController)->update( new Request([ '_status' => 'cancelled', ]), $trade->ref_code );
        sleep(3);

        // Offer -> trade
        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store( Request::create('','',[
            'country_name' => 'Zimbabwe',
            'location' => 'Marondera', 
            'offer_to' => 'buy',
            'asset_code' => 'USDT',
            'currency_code' => 'USD',
            'offer_price' => 0.95,
            'min_trade_purchase_amount' => 200,
            'max_trade_purchase_amount' => 200,
            'offer_total_purchase_amount' => 200,
            'buyer_cmplt_trade_mins_tmt' => 90,
            'pymt_method_slug' => 'cash_in_person',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store( Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Tamari Karongo', 'phone_no' => '+263 7658 357' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(3);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update( new Request([ 'pymt_declared' => true, ]), $trade->ref_code );
        sleep(3);

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