<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\File;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// to correct float values passing through json_encode
ini_set('serialize_precision', 14);

// linking storage path to url path
if (!File::exists( public_path('storage') )){
    File::link( storage_path('app/public'), public_path('storage') );
}

// Default Route
Route::get('', '__AuxController@fire_away')->name('fire_away');
Route::post('accounts', '__AuxController@default_route')->name('default_route');

// Tx recon
Route::post('webhooks/tatum/nofitications', '_TransactionController@tatum_subscription_webhook_txrecon')->name('tatum.subscription_txrecon');

// Test routes
Route::post('load_test_data', '__AuxController@load_test_data')->name('load_test_data');
/*Route::get('get_customers', '_AssetAccountController@get_customers')->name('get_customers');
Route::get('get_accounts', '_AssetAccountController@get_accounts')->name('get_accounts');
Route::get('get_addresses', '_AssetAccountController@get_addresses')->name('get_addresses');
Route::get('get_transactions', '_AssetAccountController@get_transactions')->name('get_transactions');
Route::get('get_subscriptions', '_AssetAccountController@get_subscriptions')->name('get_subscriptions');
Route::get('get_subscription_notifications', '_AssetAccountController@get_subscription_notifications')->name('get_subscription_notifications');
Route::get('redo_tatum_txrecon_transactions', '_AssetAccountController@redo_tatum_txrecon_transactions')->name('redo_tatum_txrecon_transactions');
Route::get('redo_tatum_subscription_webhook_txrecon_requests', '_AssetAccountController@redo_tatum_subscription_webhook_txrecon_requests')->name('redo_tatum_subscription_webhook_txrecon_requests');*/

// User authentication routes
Route::post('accounts/auth/signup', '_UserController@store')->name('accounts.auth.signup');
Route::post('accounts/auth/signin', '_UserController@signin')->name('accounts.auth.signin');

// User recovery routes
Route::get('accounts/recovery/username/get/send_to/{recipient_addon_name}/{recipient_addon_value}', '_UserController@get_lost_username')->name('accounts.recovery.get_lost_username');
Route::get('accounts/recovery/password/generate_reset_token/for_user/{username}/send_to/{recipient_addon_name}/{recipient_addon_value}', '_VerifTokenController@generate_password_reset_token')->name('accounts.recovery.generate_password_reset_token');
Route::post('accounts/recovery/password/reset', '_UserController@reset_lost_password')->name('accounts.recovery.reset_lost_password');

// User addon verification routes (email_address, phone_no)
Route::get('accounts/verification/{addon_name}/{addon_id}/generate_verification_token', '_VerifTokenController@generate_verification_token')->name('accounts.verification.generate_verification_token');
Route::get('accounts/verification/{addon_name}/{addon_id}/verify/{verification_token}', '_VerifTokenController@verify')->name('accounts.verification.confirm_verification_token');

Route::group(['middleware' => 'auth:api'], function () {

    // User authentication routes
    Route::post('accounts/auth/signout', '_UserController@signout')->name('accounts.auth.signout');

    // User extension management routes
    Route::post('accounts/users/{uid}/admin_extension', '_AdminExtensionController@store')->name('accounts.users.add_admin_extension');
    Route::put('accounts/users/{uid}/admin_extension', '_AdminExtensionController@update')->name('accounts.users.update_admin_extension');
    Route::delete('accounts/users/{uid}/admin_extension', '_AdminExtensionController@destroy')->name('accounts.users.delete_admin_extension');

    Route::post('accounts/users/{uid}/seller_extension', '_SellerExtensionController@store')->name('accounts.users.add_seller_extension');
    Route::put('accounts/users/{uid}/seller_extension', '_SellerExtensionController@update')->name('accounts.users.update_seller_extension');
    Route::delete('accounts/users/{uid}/seller_extension', '_SellerExtensionController@destroy')->name('accounts.users.delete_seller_extension');

    Route::post('accounts/users/{uid}/buyer_extension', '_SellerExtensionController@store')->name('accounts.users.add_buyer_extension');
    Route::put('accounts/users/{uid}/buyer_extension', '_SellerExtensionController@update')->name('accounts.users.update_buyer_extension');
    Route::delete('accounts/users/{uid}/buyer_extension', '_SellerExtensionController@destroy')->name('accounts.users.delete_buyer_extension');

    // User modification and index routes
    Route::put('accounts/users/{uid}', '_UserController@update')->name('accounts.users.update');
    Route::get('admin/users', '_UserController@index')->name('admin.users.index');
});


// Auth:null accessible routes
Route::get('content/param_checks/availability/{param_name}/{param_value}', '__AuxController@availability_check')->name('availability_check');
Route::get('content/param_checks/usability/{param_name}/{param_value}', '__AuxController@usability_check')->name('usability_check');
Route::get('content/sysconfig_params', '__AuxController@sysconfig_params')->name('sysconfig_params');
Route::get('content/sysconfig_params_enum_options', '__AuxController@sysconfig_params_enum_options')->name('sysconfig_params_enum_options');
Route::get('content/datalists', '__AuxController@datalists')->name('datalists');

Route::get('content/datalists/assets', '_AssetController@index')->name('content.assets');
Route::get('content/datalists/countries', '_CountryController@index')->name('content.countries');
Route::get('content/datalists/currencies', '_CurrencyController@index')->name('content.currencies');
Route::get('content/datalists/pymt_methods', '_PymtMethodController@index')->name('content.pymt_methods');

Route::apiResource('p2p/offers', '_OfferController')->only(['show', 'index'])->parameter('offers', 'ref_code');
Route::get('content/users/{uid}', '_UserController@show')->name('content.users.show');

// Auth:true accessible routes
Route::group(['middleware' => 'auth:api'], function () {

    Route::post('content/files/upload', '_FileController@upload')->name('files.upload');
    Route::apiResource('content/files', '_FileController')->except(['index'])->parameter('files', 'id');

    Route::post('banking/transactions/process', '_TransactionController@process')->name('process_transaction');
    Route::get('banking/transactions', '_TransactionController@index')->name('banking.transactions.index');

    Route::get('banking/deposit_tokens/{token}/use/{asset_code}', '_DepositTokenController@use')->name('use_deposit_token');
    Route::apiResource('banking/deposit_tokens', '_DepositTokenController')->except(['show','update'])->parameter('deposit_tokens', 'token');

    Route::apiResource('accounts/sessions', '_SessionController')->only(['index', 'show'])->parameter('sessions', 'id');
    Route::apiResource('accounts/notifications', '_NotificationController')->only(['index', 'show'])->parameter('notifications', 'id');
    Route::apiResource('accounts/email_addresses', '_EmailAddressController')->only(['store', 'index', 'destroy'])->parameter('email_addresses', 'uid');
    Route::apiResource('accounts/phone_nos', '_PhoneNoController')->only(['store', 'index', 'destroy'])->parameter('phone_nos', 'id');
    Route::apiResource('suppport/feedback_reports', '_FeedbackReportController')->parameter('feedback_reports', 'uid');
    Route::apiResource('suppport/chats', '_ChatController')->parameter('chats', 'uid');
    Route::apiResource('p2p/offers', '_OfferController')->only(['store', 'update', 'destroy'])->parameter('offers', 'ref_code');
    Route::apiResource('p2p/trades', '_TradeController')->except(['destroy'])->parameter('trades', 'ref_code');
    Route::apiResource('banking/asset_accounts', '_AssetAccountController')->only('store')->parameter('asset_accounts', 'id');
    Route::apiResource('banking/asset_account_addresses', '_AssetAccountAddressController')->only('store','index')->parameter('asset_account_addresses', 'id');
    Route::apiResource('content/messages', '_MessageController')->only(['index', 'store'])->parameter('messages', 'id');
    Route::apiResource('content/pinnings', '_PinningController')->only(['store', 'update', 'destroy'])->parameter('pinnings', 'id');
    Route::apiResource('content/pref_items', '_PrefItemController')->except(['destroy'])->parameter('pref_items', 'id');
    Route::apiResource('content/logs', '_LogController')->only(['index'])->parameter('logs', 'id');

    Route::apiResource('accounts/systools/reg_tokens', '_RegTokenController')->parameter('reg_tokens', 'token');

    Route::apiResource('accounts/systools/permissions', '_PermissionController')->only(['index', 'show'])->parameter('permissions', 'uid');
    Route::apiResource('accounts/systools/permission-instances', '_PermissionInstanceController')->only(['index', 'show'])->parameter('permission-instances', 'id');
    Route::apiResource('accounts/systools/user_groups', '_UserGroupController')->only(['index', 'show'])->parameter('user_groups', 'uid');
    Route::apiResource('accounts/systools/user-group-memberships', '_UserGroupMembershipController')->only(['index', 'show'])->parameter('user-group-memberships', 'id');
    Route::apiResource('content/posts', '_PostController')->only(['index', 'show'])->parameter('posts', 'id');

    Route::apiResource('admin/systools/permissions', '_PermissionController')->parameter('permissions', 'uid');
    Route::apiResource('admin/systools/permission-instances', '_PermissionInstanceController')->parameter('permission-instances', 'id');
    Route::apiResource('admin/systools/user_groups', '_UserGroupController')->parameter('user_groups', 'uid');
    Route::apiResource('admin/systools/user-group-memberships', '_UserGroupMembershipController')->parameter('user-group-memberships', 'id');
    Route::apiResource('admin/posts', '_PostController')->parameter('posts', 'id');
});