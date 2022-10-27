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
        if (_PrefItem::firstWhere('key_slug', 'scaffolding_app_enabled')->value_f()) {
            $request->validate([
                'active_session_data.token' => ['sometimes', 'string', 'size:16' ],
                'active_session_data.device_info' => ['required', 'array'],
                'active_session_data.agent_app_info' => ['required', 'array'],
                'active_session_data.utc_offset' => ['required', 'string', 'size:6'],
            ]);
        
            session()->put('utc_offset', $request->active_session_data['utc_offset']);
        
            // Response Structure
            $response = [
                'sysconfig_params_data' => (new __AuxController)->sysconfig_params()->getData()->data,
                'datalists_data' => (new __AuxController)->datalists()->getData(),
                'active_session_data' => null,
                'auth_user_data' => null,
            ];
        
            // Auth user
            $api_auth_user = auth('api')->user();
            if ($api_auth_user) {
                $response['auth_user_data'] = new _UserResource($api_auth_user);
                session()->put('api_auth_user_username', $api_auth_user->username);
            }
        
            // Active session
            $active_session_data = $request->active_session_data;
            if ($active_session_data) {
                $active_session_data['request_location'] = Location::get() ? (array)(Location::get()) : [ 'ip' => $request->ip() ];
                if (isset($active_session_data['token']) && _Session::where('token', $active_session_data['token'])->exists() && _Session::find($active_session_data['token'])['_status'] !== 'ended') {
                    $active_session_data['default_route'] = true;
                    $response['active_session_data'] = (new _SessionController)->update(new Request(array_filter($active_session_data)), $active_session_data['token'])->getData();
                } else {
                    $response['active_session_data'] = (new _SessionController)->store(new Request(array_filter($active_session_data)))->getData();
                }
            }
        
            return response()->json($response);
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
                $available = !_RegToken::where('token', $request->param_value)->exists();
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
                $available = !_User::where('username', $request->param_value)->exists() && !in_array($request->param_value , $reserved_usernames) && $regex_passes;
                $message = $available ? 'Username available for use.' : (in_array($request->param_value , $reserved_usernames) ? 'Chosen username is reserved word and can\'t be used.' : (!$regex_passes ? 'Username contains "'.$regex_failed_username.'" which is a reserved word' : 'Username already in use in the system.'));
                break;

            case 'email_address':
                $available = !(_User::where('email_address', $request->param_value)->exists() || _EmailAddress::where('email_address', $request->param_value)->exists());
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
        return response()->json($response);
    }

    public function usability_check(Request $request)
    {
        switch ($request->param_name) {
            case 'reg_token':
                $reg_token = _RegToken::find($request->param_value);
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
        return response()->json($response);
    }

    public function sysconfig_params_enum_options()
    {
        $crypto_assets = (new _AssetController)->index(new Request(['_status' =>'active']));
        $crypto_asset_code_options = [];
        foreach ($crypto_assets as $crypto_asset) {
            array_push($crypto_asset_code_options, ['slug' => $crypto_asset->code, 'name' => $crypto_asset->name ]);
        }

        $fiat_currencies = (new _CurrencyController)->index(new Request(['_status' =>'active']));
        $fiat_currency_code_options = [];
        foreach ($fiat_currencies as $fiat_currency) {
            array_push($fiat_currency_code_options, ['slug' => $fiat_currency->code, 'name' => $fiat_currency->name.' ('.$fiat_currency->symbol.')' ]);
        }
        return response()->json([
            'data' => [
                [
                    'slug' => 'crypto_asset_codes',
                    'name' => 'Crypto Assets',
                    'options' => $crypto_asset_code_options,
                ],
                [
                    'slug' => 'fiat_currency_codes',
                    'name' => 'Fiat Currencies',
                    'options' => $fiat_currency_code_options,
                ],
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
        return response()->json((new _PrefItemController)->index(new Request(['parent_uid' =>'system'])));
    }

    public function datalists()
    {
        return response()->json([
            'active_assets' => json_decode((new _AssetController)->index(new Request(['_status' =>'active']))->toJson(),true)['data'],
            'active_currencies' => json_decode((new _CurrencyController)->index(new Request(['_status' =>'active']))->toJson(),true)['data'],
            'active_pymt_methods' => json_decode((new _PymtMethodController)->index(new Request(['_status' =>'active']))->toJson(),true)['data'],
            'active_countries' => json_decode((new _CountryController)->index(new Request(['_status' =>'active']))->toJson(),true)['data'],
        ]);
    }

    private $factory_assets = [
        
        // Testnet normal
        ['chain' => 'TRON', 'code' => 'TRON', 'unit' => 'TRX', 'xpub' => 'xpub6DeqaexdQMHHYA4zrs6LeUE5A5UEbuhLUSxEchGvRia9VkmoPiAhc5mYd8PuC3A37N4AiVdS6NVozpUtACyJES6vsY4tN3ZWuovwLkMN97a'],
        ['chain' => 'ETH', 'code' => 'ETH', 'unit' => 'ETH', 'xpub' => 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX'],
        
        // Testnet inflated
        //['chain' => 'TRON', 'code' => 'TRON', 'unit' => 'USDT', 'xpub' => 'xpub6DeqaexdQMHHYA4zrs6LeUE5A5UEbuhLUSxEchGvRia9VkmoPiAhc5mYd8PuC3A37N4AiVdS6NVozpUtACyJES6vsY4tN3ZWuovwLkMN97a'],
        //['chain' => 'ETH', 'code' => 'ETH', 'unit' => 'USDT', 'xpub' => 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX'],

        // Mainnet
        //['chain' => 'TRON', 'code' => 'USDT_TRON', 'unit' => 'USDT', 'xpub' => 'xpub6FFGQ1GzANQv5mdUn2xm2JSfg7JMQeNZ2Qi1koYeYiZdawuAY8VVgChuoyeqLaN7nbsdrQ3e8NWz6CeNaWNZbbQnDrEcZQLeRvHvaLoaoci'],
        //['chain' => 'ETH', 'code' => 'USDT', 'unit' => 'USDT', 'xpub' => 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX'],
    ];

    public function load_factory_data()
    {
        $use_ttm_api = _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f();
        $clear_unsigned_transactions = true;
        if ($clear_unsigned_transactions && $use_ttm_api) {
            $chains = ['TRON', 'ETH'];
            $txns = [];
            foreach ($chains as $chain) {
                $txns = array_merge($txns, (new Tatum\Security\KMSController)->ReceivePendingTransactionsToSign(new Request(['chain' => $chain]))->getData());
            }
            foreach ($txns as $txn) {
                (new Tatum\Security\KMSController)->DeletePendingTransactionToSign(new Request(['id' => $txn->id]));
            }
        }

        $clear_virtual_accounts = false;
        if ($clear_virtual_accounts && $use_ttm_api) {
            foreach ((new Tatum\VirtualAccounts\AccountController)->getAccounts(new Request())->getData() as $account) {
                try { (new Tatum\VirtualAccounts\AccountController)->deactivateAccount(new Request(['id' => $account->id])); } catch (\Throwable $th) {}
            }
        }

        $clear_notification_webhook_subscriptions = false;
        if ($clear_notification_webhook_subscriptions && $use_ttm_api) {
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

        session()->put('active_session_token', 'FACTORY_SSN');
        session()->put('api_auth_user_username', 'system');

        if (env('BC_ENV') === 'MAINNET') {
            foreach ($this->factory_assets as $factory_asset) {
                if ($factory_asset['code'] === 'ETH') {
                    (new _AssetController)->store(new Request([
                        'name' => 'Ethereum',
                        'code' => 'ETH',
                        'unit' => 'ETH',
                        'chain' => 'ETH',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.0000000001',
                        'withdrawal_txn_fee_usd_fctr' => 3.5,
                        'withdrawal_min_limit' => 0.0005,
                        'withdrawal_max_limit' => 1,
                        'centralization_threshold' => 0.05,
                        'onchain_disclaimer' => "Ethereum network.",
                        'bc_txn_id_scan_url' => 'https://sepolia.etherscan.io/tx/{bc_txn_id}',
                    ]));
                }
                
                if ($factory_asset['code'] === 'USDT') {
                    (new _AssetController)->store(new Request([
                        'name' => 'Tether USD',
                        'code' => 'USDT',
                        'unit' => 'USDT',
                        'chain' => 'ETH',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.00001',
                        'withdrawal_txn_fee_usd_fctr' => 4.5,
                        'withdrawal_min_limit' => 1,
                        'withdrawal_max_limit' => 1000,
                        'usd_asset_exchange_rate' => 1,
                        'centralization_threshold' => 100,
                        'onchain_disclaimer' => "This Tether USD asset is a token on the Ethereum network.",
                        'bc_txn_id_scan_url' => 'https://etherscan.io/tx/{bc_txn_id}',
                    ]));
                }

                if ($factory_asset['code'] === 'TRON') {
                    (new _AssetController)->store(new Request([
                        'name' => 'Tron',
                        'code' => 'TRON',
                        'unit' => 'TRX',
                        'chain' => 'TRON',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.0000000001',
                        'withdrawal_txn_fee_usd_fctr' => 1,
                        'withdrawal_min_limit' => 10,
                        'withdrawal_max_limit' => 15000,
                        'centralization_threshold' => 1500,
                        'onchain_disclaimer' => "Tron network.",
                        'bc_txn_id_scan_url' => 'https://tronscan.org/#/transaction/{bc_txn_id}',
                    ]));
                }
                
                if ($factory_asset['code'] === 'USDT_TRON') {
                    (new _AssetController)->store(new Request([
                        'name' => 'Tether USD (Tron)',
                        'code' => 'USDT_TRON',
                        'unit' => 'USDT',
                        'chain' => 'TRON',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.00001',
                        'withdrawal_txn_fee_usd_fctr' => 1.5,
                        'withdrawal_min_limit' => 1,
                        'withdrawal_max_limit' => 1000,
                        'usd_asset_exchange_rate' => 1,
                        'centralization_threshold' => 100,
                        'onchain_disclaimer' => "This Tether USD asset is a token on the Tron network.",
                        'bc_txn_id_scan_url' => 'https://tronscan.org/#/transaction/{bc_txn_id}',
                    ]));
                }
            }

        } else {

            foreach ($this->factory_assets as $factory_asset) {
                if ($factory_asset['chain'] === 'ETH' && $factory_asset['unit'] === 'ETH') {
                    $created_asset = (new _AssetController)->store(new Request([
                        'name' => 'Ethereum',
                        'code' => 'ETH',
                        'unit' => 'ETH',
                        'chain' => 'ETH',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.0000000001',
                        'withdrawal_txn_fee_usd_fctr' => 3.5,
                        'withdrawal_min_limit' => 0.0005,
                        'withdrawal_max_limit' => 1,
                        'centralization_threshold' => 0.05,
                        'onchain_disclaimer' => "This platform is still in test mode on the sepolia testnet chain.
Onchain transactions should be handled accordingly.",
                        'ttm_gp_last_activated_index' => 15,
                        'bc_txn_id_scan_url' => 'https://sepolia.etherscan.io/tx/{bc_txn_id}',
                    ]));
                }

                if ($factory_asset['chain'] === 'ETH' && $factory_asset['unit'] === 'USDT') {
                    (new _AssetController)->store(new Request([
                        'name' => 'Tether USD',
                        'code' => 'ETH',
                        'unit' => 'USDT',
                        'chain' => 'ETH',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.00001',
                        'withdrawal_txn_fee_usd_fctr' => 3.5,
                        'withdrawal_min_limit' => 1,
                        'withdrawal_max_limit' => 1000,
                        'usd_asset_exchange_rate' => 1,
                        'centralization_threshold' => 100,
                        'onchain_disclaimer' => "This platform is still in test mode using the sepolia testnet chain.
USDT doesn't exist on testnet so we're using ETH but referring to it here as USDT.
The system does an internal conversion such that 1 ETH = 1000 USDT.
Handle all platform transactions normally but know that these values will be reflected differently outside this platform.",
                        'ttm_gp_last_activated_index' => 19,
                        'bc_txn_id_scan_url' => 'https://sepolia.etherscan.io/tx/{bc_txn_id}',
                    ]));
                }

                if ($factory_asset['chain'] === 'TRON' && $factory_asset['unit'] === 'TRX') {
                    $created_asset = (new _AssetController)->store(new Request([
                        'name' => 'Tron',
                        'code' => 'TRON',
                        'unit' => 'TRX',
                        'chain' => 'TRON',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.0000001',
                        'withdrawal_txn_fee_usd_fctr' => 1,
                        'withdrawal_min_limit' => 10,
                        'withdrawal_max_limit' => 15000,
                        'centralization_threshold' => 1500,
                        'onchain_disclaimer' => "This platform is still in test mode on the shasta testnet chain.
Onchain transactions should be handled accordingly.",
                        'ttm_gp_last_activated_index' => 4,
                        'bc_txn_id_scan_url' => 'https://shasta.tronscan.org/#/transaction/{bc_txn_id}',
                    ]));
                }

                if ($factory_asset['chain'] === 'TRON' && $factory_asset['unit'] === 'USDT') {
                    (new _AssetController)->store(new Request([
                        'name' => 'Tether USD (Tron)',
                        'code' => 'TRON',
                        'unit' => 'USDT',
                        'chain' => 'TRON',
                        'xpub' => $factory_asset['xpub'],
                        'smallest_display_unit' => '0.00001',
                        'withdrawal_txn_fee_usd_fctr' => 2,
                        'withdrawal_min_limit' => 1,
                        'withdrawal_max_limit' => 1000,
                        'usd_asset_exchange_rate' => 1,
                        'centralization_threshold' => 100,
                        'onchain_disclaimer' => "This platform is still in test mode using the shasta testnet chain.
USDT doesn't exist on testnet so we're using TRX but referring to it here as USDT.
The system does an internal conversion such that 1 TRX = 10 USDT.
Handle all internal transactions normally but know that these values will be reflected differently outside this platform.",
                        'ttm_gp_last_activated_index' => 4,
                        'bc_txn_id_scan_url' => 'https://shasta.tronscan.org/#/transaction/{bc_txn_id}',
                    ]));
                }
            }
        }

        $token_reg_changed = false;
        $token_reg_enabled_pref_item = _PrefItem::firstWhere('key_slug', 'token_reg_enabled');
        if ($token_reg_enabled_pref_item->value_f()) {
            (new _PrefItemController)->update(new Request([
                'update_note' => 'Temporarily disabling for factory users.',
                'value' => false,
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
            $token_reg_changed = true;
        }
        
        // user:developer
        (new _UserController)->store(new Request([
            'username' => 'developer',
            'email_address' => 'developer.ankelli@gmail.com',
            'password' => '20Dn4$3De0s@', 'password_confirmation' => '20Dn4$3De0s@',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'developer',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store(new Request([
            'user_username' => 'developer',
            'post_title' => 'Default Developer',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'developer',
            'user_group_slug' => 'developers',
        ]));

        // user:sysadmin
        (new _UserController)->store(new Request([
            'username' => 'sysadmin',
            'email_address' => 'sysadmin@ankelli.com',
            'password' => 'm9&S644xezfa', 'password_confirmation' => 'm9&S644xezfa',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'sysadmin',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store(new Request([
            'user_username' => 'sysadmin',
            'post_title' => 'Default System Administrator',
        ]));
        (new _BuyerExtensionController)->store(new Request([
            'user_username' => 'sysadmin',
            '_status' => 'deactivated',
        ]));
        (new _SellerExtensionController)->store(new Request([
            'user_username' => 'sysadmin',
            '_status' => 'deactivated',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'sysadmin',
            'user_group_slug' => 'system_administrators',
        ]));

        // user:busadmin
        (new _UserController)->store(new Request([
            'username' => 'busadmin',
            'email_address' => 'busadmin@ankelli.com',
            'password' => 'aC0q78&DEHh@', 'password_confirmation' => 'aC0q78&DEHh@',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'busadmin',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store(new Request([
            'user_username' => 'busadmin',
            'post_title' => 'Default Business Administrator',
        ]));
        (new _BuyerExtensionController)->store(new Request([
            'user_username' => 'busadmin',
            '_status' => 'deactivated',
        ]));
        (new _SellerExtensionController)->store(new Request([
            'user_username' => 'busadmin',
            '_status' => 'deactivated',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'busadmin',
            'user_group_slug' => 'business_administrators',
        ]));

        // user:reserves
        foreach ($this->factory_assets as $factory_asset) {
            (new _AssetWalletController)->store(new Request([
                'asset_code' => $factory_asset['code'],
                'asset_chain' => $factory_asset['chain'],
                'user_username' => 'reserves',
            ]));
            (new _AssetWalletAddressController)->store(new Request([
                'asset_code' => $factory_asset['code'],
                'user_username' => 'reserves',
            ]));
        }

        // user:busops // used for collecting platform fees and deposit token topups
        (new _UserController)->store(new Request([
            'username' => 'busops',
            'email_address' => 'busops@ankelli.com',
            'password' => '85lD1Rs%nwxb', 'password_confirmation' => '85lD1Rs%nwxb',
        ]));
        foreach ($this->factory_assets as $factory_asset) {
            (new _AssetWalletController)->store(new Request([
                'asset_code' => $factory_asset['code'],
                'asset_chain' => $factory_asset['chain'],
                'user_username' => 'busops',
            ]));
            (new _AssetWalletAddressController)->store(new Request([
                'asset_code' => $factory_asset['code'],
                'user_username' => 'busops',
            ]));
        }
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'busops',
            'user_group_slug' => 'default_users',
        ]));
        (new _AdminExtensionController)->store(new Request([
            'user_username' => 'busops',
            'post_title' => 'Ankelli Business Operations',
        ]));
        (new _BuyerExtensionController)->store(new Request([
            'user_username' => 'busops',
            '_status' => 'deactivated',
        ]));
        (new _SellerExtensionController)->store(new Request([
            'user_username' => 'busops',
            '_status' => 'deactivated',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'busops',
            'user_group_slug' => 'business_administrators',
        ]));

        // user:guddaz
        (new _UserController)->store(new Request([
            'username' => 'guddaz', 'email_address' => 'goodhopedhliwayo@gmail.com',
            'password' => 'd25I!fEAk7qx', 'password_confirmation' => 'd25I!fEAk7qx',
        ]));
        if (false) {
            foreach ($this->factory_assets as $factory_asset) {
                (new _AssetWalletController)->store(new Request([
                    'asset_code' => $factory_asset['code'],
                    'asset_chain' => $factory_asset['chain'],
                    'user_username' => 'guddaz',
                ]));
                (new _AssetWalletAddressController)->store(new Request([
                    'asset_code' => $factory_asset['code'],
                    'user_username' => 'guddaz',
                ]));
            }
        }
        (new _AdminExtensionController)->store(new Request([
            'user_username' => 'guddaz', 'post_title' => 'Head System Developer',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'guddaz',
            'user_group_slug' => 'developers',
        ]));
        
        // user:paywyze
        (new _UserController)->store(new Request([
            'username' => 'paywyze', 'email_address' => 'lotto7@yahoo.com',
            'password' => '2weNi10*Hul@', 'password_confirmation' => '2weNi10*Hul@',
        ]));
        foreach ($this->factory_assets as $factory_asset) {
            (new _AssetWalletController)->store(new Request([
                'asset_code' => $factory_asset['code'],
                'asset_chain' => $factory_asset['chain'],
                'user_username' => 'paywyze',
            ]));
            (new _AssetWalletAddressController)->store(new Request([
                'asset_code' => $factory_asset['code'],
                'user_username' => 'paywyze',
            ]));
        }
        (new _AdminExtensionController)->store(new Request([
            'user_username' => 'paywyze', 'post_title' => 'Head Business Administrator',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'paywyze', 'user_group_slug' => 'system_administrators',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'paywyze', 'user_group_slug' => 'user_administrators',
        ]));
        (new _UserGroupMembershipController)->store(new Request([
            'user_username' => 'paywyze', 'user_group_slug' => 'business_administrators',
        ]));

        if ($token_reg_changed) {
            (new _PrefItemController)->update(new Request([
                'update_note' => 'Resetting to default value.',
                'value' => $token_reg_enabled_pref_item->value_f(),
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
        }

        (new _RegTokenController)->store(new Request(['token' => '1234567890']));

        session()->forget('active_session_token');
        session()->forget('api_auth_user_username');
    }

    public function load_test_data()
    {
        if (_PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f()) {
            return;
        }

        session()->put('active_session_token', 'TEST_SSN');
        session()->put('api_auth_user_username', 'system');

        $token_reg_changed = false;
        $token_reg_enabled_pref_item = _PrefItem::firstWhere('key_slug', 'token_reg_enabled');
        if ($token_reg_enabled_pref_item->value_f()) {
            (new _PrefItemController)->update(new Request([
                'update_note' => 'Temporarily disabling for test users.',
                'value' => false,
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
            $token_reg_changed = true;
        }

        $simple_users = ['ross', 'jimmy', 'keith', 'peter', 'flint', 'clarence', 'raymond', 'nassim'];

        foreach ($simple_users as $key => $username) {
            (new _UserController)->store(new Request([
                'username' => $username, 'email_address' => $username.'@example.com',
                'password' => 'Def-Pass#123', 'password_confirmation' => 'Def-Pass#123',
            ]));
        }

        // Internalisation transactions

        $internalisations = [
            ['busops', 3000, 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.'],
            ['guddaz', 248.87587867, 'Transfer from Coinbase wallet to Ankelli wallet.'],
            ['paywyze', 967.86579, 'Transfer from Ledger wallet to Ankelli wallet.'],
            ['flint', 498.6678, 'Transfer from Coinbase wallet to Ankelli wallet.'],
            ['guddaz', 198.9012, 'Transfer from Exodus wallet to Ankelli wallet.'],
            ['paywyze', 146.76, 'Transfer from Coinbase wallet to Ankelli wallet.'],
        ];

        foreach ($internalisations as $key => $internalisation) {
            (new _TransactionController)->test_transfer(new Request([
                'recipient_username' => $internalisation[0], 
                'recipient_note' => $internalisation[2],
                'asset_code' => $this->factory_assets[0]['code'],
                'asset_value' => $internalisation[1],
            ]));
            sleep(2);
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
            $deposit_token = (new _DepositTokenController)->store(Request::create('','',[
                'asset_code' => $this->factory_assets[0]['code'],
                'asset_value' => $deposit_tokener[1],
                'currency_code' => $deposit_tokener[2],
                'currency_amount' => $deposit_tokener[3],
            ],[],[],['HTTP_accept'=>'application/json']))->getData();
            session()->put('api_auth_user_username', $deposit_tokener[0]);
            (new _DepositTokenController)->use($deposit_token->token, $this->factory_assets[0]['code']);
            sleep(2);
        }
        

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'ross');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'mukuru',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'guddaz');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'sender_password' => 'd25I!fEAk7qx', 'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 7658 357' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        (new _MessageController)->store(new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I'm sending the cash in a couple of minutes."
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        sleep(2);
        (new _MessageController)->store(new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I've sent the cash.\nPlease confirm receiving it."
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _MessageController)->store(new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "I've collected the money."
        ]));
        sleep(2);
        (new _MessageController)->store(new Request([
            'parent_table' => '__trades',
            'parent_uid' => $trade->ref_code,
            'body' => "Pleasure doing business with you."
        ]));
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'd25I!fEAk7qx' ]), $trade->ref_code);
        sleep(2);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
            'comment' => 'Quick trade. Buyer was very responsive.'
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
            'comment' => 'Seller ensured a fast trade.',
        ]));
        sleep(2);

        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'location' => 'Norton', 
            'offer_to' => 'sell',
            'asset_code' => $this->factory_assets[0]['code'],
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
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.95,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'world_remit',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'sender_password' => '2weNi10*Hul@', 'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 765 357' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => '2weNi10*Hul@']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(2);


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'keith');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'paypal',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 150, 'sender_password' => '2weNi10*Hul@', 'pymt_details' => [ 'fullname' => 'Tawanda Chakatsva', 'email_address' => 'tawanda@example.com' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => '2weNi10*Hul@']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);


        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'jimmy');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zambia',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 1000,
            'offer_total_purchase_amount' => 1000,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'skrill',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'paywyze');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 600, 'sender_password' => '2weNi10*Hul@', 'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'email_address' => 'mulenga@example.com' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => '2weNi10*Hul@']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'clarence');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zambia',
            'location' => 'Lusaka CBD', 
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 1000,
            'offer_total_purchase_amount' => 1000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'cash_in_person',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'ross');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'phone_no' => 'mulenga@example.com', ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'paywyze');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zambia',
            'location' => 'Lusaka CBD', 
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'ZMW',
            'offer_price' => 13.3,
            'min_trade_purchase_amount' => 2000,
            'max_trade_purchase_amount' => 15000,
            'offer_total_purchase_amount' => 20000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'cash_in_person',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 3000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Mulenga Mwamba', 'phone_no' => 'mulenga@example.com', ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'peter');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 200,
            'max_trade_purchase_amount' => 300,
            'offer_total_purchase_amount' => 300,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'fbc_bank',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 250, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Tadiwa Magodi', 'account_no' => '506788965445' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'flint');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'South Africa',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'ZAR',
            'offer_price' => 16.92,
            'min_trade_purchase_amount' => 1000,
            'max_trade_purchase_amount' => 2500,
            'offer_total_purchase_amount' => 2500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'fnb_bank',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 2500, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'William Mbeki', 'account_no' => '6507890898', ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'paywyze');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'South Africa',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'ZAR',
            'offer_price' => 17.02,
            'min_trade_purchase_amount' => 500,
            'max_trade_purchase_amount' => 3000,
            'offer_total_purchase_amount' => 3000,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'fnb_bank',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 3000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'William Mbeki', 'account_no' => '6507890898' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'raymond');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Italy',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'EUR',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 200,
            'max_trade_purchase_amount' => 500,
            'offer_total_purchase_amount' => 500,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'world_remit'
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Panashe Gabvu', 'phone_no' => '+78 568 6503', ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'nassim');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Algeria',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'DZD',
            'offer_price' => 200,
            'min_trade_purchase_amount' => 10000,
            'max_trade_purchase_amount' => 40000,
            'offer_total_purchase_amount' => 40000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'algerie_poste',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'jimmy');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 35000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'account_holder_name' => 'Djenna Moulad', 'account_no' => '22657899', 'account_key' => '67', ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 5,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'location' => 'Marondera', 
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 50,
            'max_trade_purchase_amount' => 200,
            'offer_total_purchase_amount' => 200,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'cash_in_person'
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 150, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Tamari Karongo', 'address' => 'Opposite OK Marondera', 'phone_no' => '+263 7658 357' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);

        // Trade -> transaction
        session()->put('api_auth_user_username', 'keith');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 50, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Samuel Kaviya', 'phone_no' => '+263 772 234 677' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);

        // Offer -> trade -> transaction
        session()->put('api_auth_user_username', 'peter');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Algeria',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'DZD',
            'offer_price' => 195,
            'min_trade_purchase_amount' => 20000,
            'max_trade_purchase_amount' => 40000,
            'offer_total_purchase_amount' => 40000,
            'buyer_cmplt_trade_mins_tmt' => 120,
            'pymt_method_slug' => 'algerie_poste',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 36000, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'account_holder_name' => 'Timothy Tambo', 'account_number' => '22508678', 'account_key' => '87' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_confirmed' => true, 'sender_password' => 'Def-Pass#123']), $trade->ref_code);
        sleep(2);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->offer_creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 4,
        ]));
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _ReviewController)->store(new Request([ 
            'parent_table' => '__users',
            'parent_uid' => $trade->creator_username,
            'pivot_parent_table' => '__trades',
            'pivot_parent_uid' => $trade->ref_code,
            'rating' => 3,
        ]));
        sleep(2);

        // Offer -> trade
        session()->put('api_auth_user_username', 'raymond');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.94,
            'min_trade_purchase_amount' => 100,
            'max_trade_purchase_amount' => 100,
            'offer_total_purchase_amount' => 100,
            'buyer_cmplt_trade_mins_tmt' => 30,
            'pymt_method_slug' => 'mukuru',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'guddaz');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 100, 'sender_password' => 'd25I!fEAk7qx', 'pymt_details' => [ 'fullname' => 'Kudakwashe Magadze', 'phone_no' => '+263 765 357' ] ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        sleep(2);
        (new _TradeController)->update(new Request([ '_status' => 'cancelled', ]), $trade->ref_code);
        sleep(2);

        // Offer -> trade
        session()->put('api_auth_user_username', 'guddaz');
        $offer = (new _OfferController)->store(Request::create('','',[
            'country_name' => 'Zimbabwe',
            'location' => 'Marondera', 
            'offer_to' => 'buy',
            'asset_code' => $this->factory_assets[0]['code'],
            'currency_code' => 'USD',
            'offer_price' => 0.95,
            'min_trade_purchase_amount' => 200,
            'max_trade_purchase_amount' => 200,
            'offer_total_purchase_amount' => 200,
            'buyer_cmplt_trade_mins_tmt' => 90,
            'pymt_method_slug' => 'cash_in_person',
        ],[],[],['HTTP_accept'=>'application/json']))->getData();
        session()->put('api_auth_user_username', 'flint');
        $trade = (new _TradeController)->store(Request::create('','',[ 'offer_ref_code' => $offer->ref_code, 'currency_amount' => 200, 'sender_password' => 'Def-Pass#123', 'pymt_details' => [ 'fullname' => 'Tamari Karongo', 'phone_no' => '+263 7658 357' ], ],[],[],['HTTP_accept'=>'application/json']))->getData();
        sleep(2);
        session()->put('api_auth_user_username', $trade->offer_creator_username);
        (new _TradeController)->show($trade->ref_code);
        session()->put('api_auth_user_username', $trade->creator_username);
        (new _TradeController)->update(new Request([ 'pymt_declared' => true, ]), $trade->ref_code);
        sleep(2);

        if ($token_reg_changed) {
            (new _PrefItemController)->update(new Request([
                'update_note' => 'Resetting to default value.',
                'value' => $token_reg_enabled_pref_item->value_f(),
                'value_type' => 'boolean',
            ]), $token_reg_enabled_pref_item->id);
        }

        session()->forget('active_session_token');
        session()->forget('api_auth_user_username');
    }
}