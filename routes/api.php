<?php

use Illuminate\Http\Request;
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
Route::post('', 'App\Http\Controllers\API\__AuxController@default_route')->name('default_route');

Route::group([ 'namespace' => 'App\Http\Controllers\API' ], function() {
    
    // Tx recon
    Route::post('webhooks/tatum/nofitications', '_TransactionController@tatum_subscription_webhook_txrecon')->name('tatum.subscription_txrecon');

    // Test routes
    /*Route::post('load_test_data', 'App\Http\Controllers\API\__AuxController@load_test_data')->name('load_test_data');
    Route::get('get_customers', 'App\Http\Controllers\API\_AssetAccountController@get_customers')->name('get_customers');
    Route::get('get_accounts', 'App\Http\Controllers\API\_AssetAccountController@get_accounts')->name('get_accounts');
    Route::get('get_addresses', 'App\Http\Controllers\API\_AssetAccountController@get_addresses')->name('get_addresses');
    Route::get('get_transactions', 'App\Http\Controllers\API\_AssetAccountController@get_transactions')->name('get_transactions');
    Route::get('get_subscriptions', 'App\Http\Controllers\API\_AssetAccountController@get_subscriptions')->name('get_subscriptions');
    Route::get('get_subscription_notifications', 'App\Http\Controllers\API\_AssetAccountController@get_subscription_notifications')->name('get_subscription_notifications');
    Route::get('redo_tatum_txrecon_transactions', 'App\Http\Controllers\API\_AssetAccountController@redo_tatum_txrecon_transactions')->name('redo_tatum_txrecon_transactions');
    Route::get('redo_tatum_subscription_webhook_txrecon_requests', 'App\Http\Controllers\API\_AssetAccountController@redo_tatum_subscription_webhook_txrecon_requests')->name('redo_tatum_subscription_webhook_txrecon_requests');*/

    // User authentication routes
    Route::post('users/signup', '_UserController@store')->name('users.signup');
    Route::post('users/signin', '_UserController@signin')->name('users.signin');

    // User recovery routes
    Route::get('users/recovery/username/get/send_to/{recipient_addon_name}/{recipient_addon_value}', '_UserController@get_lost_username')->name('users.recovery.get_lost_username');
    Route::get('users/recovery/password/generate_reset_token/for_user/{username}/send_to/{recipient_addon_name}/{recipient_addon_value}', '_VerifTokenController@generate_password_reset_token')->name('users.recovery.generate_password_reset_token');
    Route::post('users/recovery/password/reset', '_UserController@reset_lost_password')->name('users.recovery.reset_lost_password');

    // User addon verification routes (email_address, phone_no)
    Route::get('users/verification/{addon_name}/{addon_id}/generate_verification_token', '_VerifTokenController@generate_verification_token')->name('users.verification.generate_verification_token');
    Route::get('users/verification/{addon_name}/{addon_id}/verify/{verification_token}', '_VerifTokenController@verify')->name('users.verification.confirm_verification_token');

    Route::group(['middleware' => 'auth:api'], function () {

        // User authentication routes
        Route::post('users/signout', '_UserController@signout')->name('users.signout');

        // User extension management routes
        Route::post('users/{uid}/admin_extension', '_AdminExtensionController@store')->name('users.add_admin_extension');
        Route::put('users/{uid}/admin_extension', '_AdminExtensionController@update')->name('users.update_admin_extension');
        Route::delete('users/{uid}/admin_extension', '_AdminExtensionController@destroy')->name('users.delete_admin_extension');

        Route::post('users/{uid}/seller_extension', '_SellerExtensionController@store')->name('users.add_seller_extension');
        Route::put('users/{uid}/seller_extension', '_SellerExtensionController@update')->name('users.update_seller_extension');
        Route::delete('users/{uid}/seller_extension', '_SellerExtensionController@destroy')->name('users.delete_seller_extension');

        Route::post('users/{uid}/buyer_extension', '_SellerExtensionController@store')->name('users.add_buyer_extension');
        Route::put('users/{uid}/buyer_extension', '_SellerExtensionController@update')->name('users.update_buyer_extension');
        Route::delete('users/{uid}/buyer_extension', '_SellerExtensionController@destroy')->name('users.delete_buyer_extension');

        // User modification and index routes
        Route::apiResource('users', '_UserController')->only(['update', 'index'])->parameter('users', 'uid');
    });


    // Auth:null accessible routes
    Route::get('param_checks/availability/{param_name}/{param_value}', '__AuxController@availability_check')->name('availability_check');
    Route::get('param_checks/usability/{param_name}/{param_value}', '__AuxController@usability_check')->name('usability_check');
    Route::get('sysconfig_params', '__AuxController@sysconfig_params')->name('sysconfig_params');
    Route::get('sysconfig_params_enum_options', '__AuxController@sysconfig_params_enum_options')->name('sysconfig_params_enum_options');
    Route::get('datalists', '__AuxController@datalists')->name('datalists');

    Route::apiResource('datalists/assets', '_AssetController')->only(['index'])->parameter('assets', 'id');
    Route::apiResource('datalists/countries', '_CountryController')->only(['index'])->parameter('countries', 'id');
    Route::apiResource('datalists/currencies', '_CurrencyController')->only(['index'])->parameter('currencies', 'id');
    Route::apiResource('datalists/pymt_methods', '_PymtMethodController')->only(['index'])->parameter('pymt_methods', 'id');

    Route::apiResource('offers', '_OfferController')->only(['show', 'index'])->parameter('offers', 'ref_code');
    Route::apiResource('users', '_UserController')->only(['show'])->parameter('users', 'uid');

    // Auth:true accessible routes
    Route::group(['middleware' => 'auth:api'], function () {

        Route::post('files/upload', '_FileController@upload')->name('files.upload');
        Route::apiResource('files', '_FileController')->except(['index'])->parameter('files', 'id');

        Route::post('transactions/process', '_TransactionController@process')->name('process_transaction');
        Route::apiResource('transactions', '_TransactionController')->only(['index'])->parameter('transactions', 'ref_code');

        Route::get('deposit_tokens/{token}/use/{asset_code}', '_DepositTokenController@use')->name('use_deposit_token');
        Route::apiResource('deposit_tokens', '_DepositTokenController')->parameter('deposit_tokens', 'token');

        Route::apiResource('email_addresses', '_EmailAddressController')->only(['store', 'index', 'destroy'])->parameter('email_addresses', 'uid');
        Route::apiResource('phone_nos', '_PhoneNoController')->only(['store', 'index', 'destroy'])->parameter('phone_nos', 'id');
        Route::apiResource('feedback_reports', '_FeedbackReportController')->parameter('feedback_reports', 'uid');
        Route::apiResource('offers', '_OfferController')->only(['store', 'update', 'destroy'])->parameter('offers', 'ref_code');
        Route::apiResource('trades', '_TradeController')->except(['destroy'])->parameter('trades', 'ref_code');
        Route::apiResource('asset_accounts', '_AssetAccountController')->only('store')->parameter('asset_accounts', 'id');
        Route::apiResource('asset_account_addresses', '_AssetAccountAddressController')->only('store','index')->parameter('asset_account_addresses', 'id');
        Route::apiResource('messages', '_MessageController')->only(['index', 'store'])->parameter('messages', 'id');
        Route::apiResource('pinnings', '_PinningController')->only(['store', 'update', 'destroy'])->parameter('pinnings', 'id');
        Route::apiResource('pref_items', '_PrefItemController')->parameter('pref_items', 'id');
        Route::apiResource('logs', '_LogController')->only(['index'])->parameter('logs', 'id');
        Route::apiResource('notifications', '_NotificationController')->only(['index', 'show'])->parameter('notifications', 'id');

        Route::apiResource('systools/exportables', '_ExportableController')->parameter('exportables', 'id');
        Route::apiResource('systools/reg_tokens', '_RegTokenController')->parameter('reg_tokens', 'token');

        Route::apiResource('systools/permissions', '_PermissionController')->parameter('permissions', 'uid');
        Route::apiResource('systools/permission_instances', '_PermissionInstanceController')->parameter('permission_instances', 'id');
        Route::apiResource('systools/user_groups', '_UserGroupController')->parameter('user_groups', 'uid');
        Route::apiResource('systools/user_group_memberships', '_UserGroupMembershipController')->parameter('user_group_memberships', 'id');
    });

});