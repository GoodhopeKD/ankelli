<?php

use Illuminate\Support\Facades\Route;

Route::group(['domain' => 'https://www.'.env('MIX_DOMAIN_NAME')], function(){
    Route::view('/', 'scaffolding_app');
    Route::view('/about', 'main/about');
    Route::view('/contact', 'main/contact');
    Route::view('/faq', 'main/faq');
    Route::view('/terms-of-service', 'main/terms_of_service');
    Route::view('/privacy-policy', 'main/privacy_policy');
    Route::view('/blog', 'main/blog');
    Route::view('/blog_posts/{id}', 'main/blog');
});

Route::group(['domain' => 'https://p2p.'.env('MIX_DOMAIN_NAME')], function(){
    $p2p_scaffolding_app_paths = [
        '/',
        '/offers',
        '/offers/new',
        '/offers/{ref_code}',
        '/offers/{ref_code}/{currency_amount}',
        '/trades',
        '/trades/{ref_code}',
        '/my-offers',
        '/my-offers/{ref_code}',
    ];
    foreach ($p2p_scaffolding_app_paths as $path) {
        Route::view($path, 'scaffolding_app');
    }
});

Route::group(['domain' => 'https://pay.'.env('MIX_DOMAIN_NAME')], function(){
    $pay_scaffolding_app_paths = [
        '/',
        '/merchants',
        '/merchants/{username}',
        '/virtual-cards',
        '/virtual-cards/{id}',
        '/platform-payments/receive',
        '/platform-payments/send',
    ];
    foreach ($pay_scaffolding_app_paths as $path) {
        Route::view($path, 'scaffolding_app');
    }
});

Route::group(['domain' => 'https://admin.'.env('MIX_DOMAIN_NAME')], function(){
    $admin_scaffolding_app_paths = [
        '/',
        '/analytics/users',
        '/analytics/funds',
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
        Route::view($path, 'scaffolding_app');
    }
});

Route::group(['domain' => 'https://funds.'.env('MIX_DOMAIN_NAME')], function(){
    $funds_scaffolding_app_paths = [
        '/',
        '/my-crypto-wallets',
        '/transactions',
        '/statements',
        '/deposits/receive-crypto',
        '/deposits/token-topup',
        '/withdrawals',
        '/crypto-conversions',
    ];
    foreach ($funds_scaffolding_app_paths as $path) {
        Route::view($path, 'funds/scaffolding_app');
    }
});

Route::group(['domain' => 'https://support.'.env('MIX_DOMAIN_NAME')], function(){
    $support_scaffolding_app_paths = [
        '/',
        '/flagged-elements/users',
        '/flagged-elements/users/{username}',
        '/flagged-elements/trades',
        '/flagged-elements/trades/{ref_code}',
        '/feedback-reports',
        '/feedback-reports/{ticket_code}',
        '/chats',
        '/chats/{chat_id}',
    ];
    foreach ($support_scaffolding_app_paths as $path) {
        Route::view($path, 'scaffolding_app');
    }
});

Route::group(['domain' => 'https://accounts.'.env('MIX_DOMAIN_NAME')], function(){
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

        '/referral-program',
    ];
    foreach ($support_scaffolding_app_paths as $path) {
        Route::view($path, 'scaffolding_app');
    }
});