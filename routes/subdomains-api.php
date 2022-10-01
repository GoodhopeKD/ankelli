<?php

use Illuminate\Support\Facades\Route;

Route::group(['domain' => 'https://content.'.env('MIX_DOMAIN_NAME')], function(){
    Route::get('param_checks/availability/{param_name}/{param_value}', '__AuxController@availability_check')->name('availability_check');
    Route::get('param_checks/usability/{param_name}/{param_value}', '__AuxController@usability_check')->name('usability_check');
    Route::get('sysconfig_params', '__AuxController@sysconfig_params')->name('sysconfig_params');
    Route::get('sysconfig_params_enum_options', '__AuxController@sysconfig_params_enum_options')->name('sysconfig_params_enum_options');
    Route::get('datalists', '__AuxController@datalists')->name('datalists');

    Route::apiResource('datalists/assets', '_AssetController')->only(['index'])->parameter('assets', 'id');
    Route::apiResource('datalists/countries', '_CountryController')->only(['index'])->parameter('countries', 'id');
    Route::apiResource('datalists/currencies', '_CurrencyController')->only(['index'])->parameter('currencies', 'id');
    Route::apiResource('datalists/pymt_methods', '_PymtMethodController')->only(['index'])->parameter('pymt_methods', 'id');
});

Route::group(['domain' => 'https://webhooks.'.env('MIX_DOMAIN_NAME')], function(){
    Route::post('tatum/nofitications', '_TransactionController@tatum_subscription_webhook_txrecon')->name('tatum.subscription_txrecon');
});

Route::group(['domain' => 'https://p2p.'.env('MIX_DOMAIN_NAME')], function(){
    Route::apiResource('offers', '_OfferController')->only(['show', 'index'])->parameter('offers', 'ref_code');
    Route::group(['middleware' => 'auth:accounts'], function () {
        Route::apiResource('offers', '_OfferController')->only(['store', 'update', 'destroy'])->parameter('offers', 'ref_code');
        Route::apiResource('trades', '_TradeController')->except(['destroy'])->parameter('trades', 'ref_code');
    });
});

Route::group(['domain' => 'https://pay.'.env('MIX_DOMAIN_NAME')], function(){
    $pay_scaffolding_app_paths = [
        '/',
        '/merchants',
        '/merchants/{username}',
        '/virtual-cards',
        '/virtual-cards/{id}',
        '/qr-payments/receive',
        '/qr-payments/send',
    ];
    foreach ($pay_scaffolding_app_paths as $path) {
        //Route::view($path, 'pay/scaffolding_app');
    }
});

Route::group(['domain' => 'https://admin.'.env('MIX_DOMAIN_NAME')], function(){
    $admin_scaffolding_app_paths = [
        '/',
        '/analytics/users',
        '/analytics/banking',
        '/analytics/pay',
        '/analytics/p2p',
        '/sysconfig',
        '/systools/user-groups',
        '/systools/user-groups/new',
        '/systools/user-groups/{user_group_slug}',
        '/systools/user-groups/{user_group_slug}/user-group-memberships',
        '/systools/permissions',
        '/systools/permissions/new',
        '/systools/permissions/{permission_slug}',
        '/systools/permissions/{permission_slug}/permission-instances',
        '/datalists/assets',
        '/datalists/currencies',
        '/datalists/payment-methods',
        '/datalists/countries',
    ];
    foreach ($admin_scaffolding_app_paths as $path) {
        //Route::view($path, 'admin/scaffolding_app');
    }
});

Route::group(['domain' => 'https://banking.'.env('MIX_DOMAIN_NAME')], function(){
    $banking_scaffolding_app_paths = [
        '/',
        '/my-crypto-wallets',
        '/my-fiat-accounts',
        '/transactions',
        '/statements',
        '/deposits/receive-crypto',
        '/deposits/token-topup',
        '/withdrawals/send-crypto',
        '/withdrawals/via-agent',
    ];
    foreach ($banking_scaffolding_app_paths as $path) {
        //Route::view($path, 'banking/scaffolding_app');
    }
});

Route::group(['domain' => 'https://support.'.env('MIX_DOMAIN_NAME')], function(){
    $support_scaffolding_app_paths = [
        '/',
        '/flagged-elements/users',
        '/flagged-elements/users/{username}',
        '/flagged-elements/offers',
        '/flagged-elements/offers/{ref_code}',
        '/flagged-elements/trades',
        '/flagged-elements/trades/{ref_code}',
        '/feedback-reports',
        '/feedback-reports/{ticket_code}',
        '/chats',
        '/chats/{chat_id}',
    ];
    foreach ($support_scaffolding_app_paths as $path) {
        //Route::view($path, 'support/scaffolding_app');
    }
});

Route::group(['domain' => 'https://accounts.'.env('MIX_DOMAIN_NAME')], function(){
    Route::post('auth/signup', '_UserController@store')->name('accounts.auth.signup');
    Route::post('auth/signin', '_UserController@signin')->name('accounts.auth.signin');

    // User recovery routes
    Route::get('recovery/username/get/send_to/{recipient_addon_name}/{recipient_addon_value}', '_UserController@get_lost_username')->name('accounts.recovery.get_lost_username');
    Route::get('recovery/password/generate_reset_token/for_user/{username}/send_to/{recipient_addon_name}/{recipient_addon_value}', '_VerifTokenController@generate_password_reset_token')->name('accounts.recovery.generate_password_reset_token');
    Route::post('recovery/password/reset', '_UserController@reset_lost_password')->name('accounts.recovery.reset_lost_password');

    // User addon verification routes (email_address, phone_no)
    Route::get('verification/{addon_name}/{addon_id}/generate_verification_token', '_VerifTokenController@generate_verification_token')->name('accounts.verification.generate_verification_token');
    Route::get('verification/{addon_name}/{addon_id}/verify/{verification_token}', '_VerifTokenController@verify')->name('accounts.verification.confirm_verification_token');

    Route::group(['middleware' => 'auth:accounts'], function () {
        Route::post('auth/signout', '_UserController@signout')->name('accounts.auth.signout');

        // User extension management routes
        Route::post('users/{uid}/admin_extension', '_AdminExtensionController@store')->name('accounts.add_user_admin_extension');
        Route::put('users/{uid}/admin_extension', '_AdminExtensionController@update')->name('accounts.update_user_admin_extension');
        Route::delete('users/{uid}/admin_extension', '_AdminExtensionController@destroy')->name('accounts.delete_user_admin_extension');

        Route::post('users/{uid}/seller_extension', '_SellerExtensionController@store')->name('accounts.add_user_seller_extension');
        Route::put('users/{uid}/seller_extension', '_SellerExtensionController@update')->name('accounts.update_user_seller_extension');
        Route::delete('users/{uid}/seller_extension', '_SellerExtensionController@destroy')->name('accounts.delete_user_seller_extension');

        Route::post('users/{uid}/buyer_extension', '_SellerExtensionController@store')->name('accounts.add_user_buyer_extension');
        Route::put('users/{uid}/buyer_extension', '_SellerExtensionController@update')->name('accounts.update_user_buyer_extension');
        Route::delete('users/{uid}/buyer_extension', '_SellerExtensionController@destroy')->name('accounts.delete_user_buyer_extension');

        // User modification route
        Route::put('users/{uid}', '_UserController@update')->name('accounts.update_user');
    });

    $support_scaffolding_app_paths = [
        '/auth/signup',
        '/auth/signin',
        '/auth/signout',
        '/recovery/generate_password_reset_token',
        '/recovery/reset_lost_password',
        '/recovery/reset_lost_password/{username}/{password_reset_token}',
        '/recovery/get_lost_username',
        '/verification/email_address/{email_address_id}/{email_address_verification_token}',
        '/verification/phone_no/{phone_no_id}/{phone_no_verification_token}',
        
        '/profile', // display photo, username,
        '/settings', //display theme, language
        '/settings/change-password',
        '/settings/email-addresses',
        '/settings/phone-numbers',
        '/activity/sessions',
        '/activity/logger',
        '/systools/user-group-memberships',
        '/systools/permission-instances',
    ];
    foreach ($support_scaffolding_app_paths as $path) {
        //Route::view($path, 'support/scaffolding_app');
    }
});