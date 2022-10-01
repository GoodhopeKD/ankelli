<?php

use Illuminate\Support\Facades\Route;

/* 
    SEO Friendly navigation 
    Routes open scaffolding_app but with custom html wrapper
*/
Route::view('/about', 'pages/about');
Route::view('/contact', 'pages/contact');
Route::view('/faq', 'pages/faq');
Route::view('/terms-of-service', 'pages/terms_of_service');
Route::view('/privacy-policy', 'pages/privacy_policy');

/*
    Root app
    Doesn't use laravel api
*/
Route::view('/root', 'pages/root/index');
Route::view('/root/signin', 'pages/root/signin');
Route::view('/root/sysconfig', 'pages/root/sysconfig');
Route::view('/root/posts', 'pages/root/posts');

/* 
    React scaffolding app
*/
$valid_paths = [

    // default
    "/",
    "/about",
    "/contact",
    "/contact/form",
    "/privacy-policy",
    "/terms-of-service",
    "/blog-posts",
    "/blog-posts/{blog_post_id}",
    "/team",
    "/learn",
    "/faq",
    "/support",
    "/find-us",
    "/supported-payment-methods",
    "/supported-fiat-currencies",
    "/supported-crypto-assets",
    "/serviced-countries",

    // p2p
    "/p2p",
    "/p2p/offers",
    "/p2p/offers/{ref_code}",
    "/p2p/offers/{ref_code}/{currency_amount}",
    "/p2p/offers/new",
    "/p2p/trades",
    "/p2p/trades/{ref_code}",
    "/p2p/my-offers",
    "/p2p/my-offers/{ref_code}",

    // pay
    "/pay/home",
    "/pay/merchants",
    "/pay/merchants/{username}",
    "/pay/virtual-cards",
    "/pay/virtual-cards/{virtual_card_id}",
    "/pay/qr-payments/receive",
    "/pay/qr-payments/send",

    // banking
    "/banking/overview",
    "/banking/my-crypto-wallets",
    "/banking/my-fiat-accounts",
    "/banking/deposits/receive-crypto",
    "/banking/deposits/receive-fiat",
    "/banking/deposits/token-topup",
    "/banking/withdrawals/send-crypto",
    "/banking/withdrawals/send-fiat",
    "/banking/withdrawals/via-agent",
    "/banking/transactions",
    "/banking/crypto-fiat-conversion",

    // accounts
    "/accounts/profile",
    "/accounts/settings",
    "/accounts/settings/change-password",
    "/accounts/settings/email-addresses",
    "/accounts/settings/phone-numbers",
    "/accounts/verification/email_address",
    "/accounts/verification/email_address/{email_address_id}/{email_address_verification_token}",
    "/accounts/verification/phone_no",
    "/accounts/verification/phone_no/{phone_no_id}/{phone_no_verification_token}",
    "/accounts/systools/user-group-memberships",
    "/accounts/systools/permission-instances",
    "/accounts/activity/sessions",
    "/accounts/activity/sessions/{session_token}",
    "/accounts/activity/logger",
    "/accounts/referral-program",

    "/accounts/auth/signin",
    "/accounts/auth/signup",
    "/accounts/recovery/generate_password_reset_token",
    "/accounts/recovery/reset_lost_password",
    "/accounts/recovery/reset_lost_password/{username}/{password_reset_token}",
    "/accounts/recovery/get_lost_username",
    "/accounts/notifications",
    "/accounts/notifications/{notification_id}",

    // admin
    "/admin/dashboard",
    "/admin/analytics/users",
    "/admin/analytics/banking",
    "/admin/analytics/pay",
    "/admin/analytics/p2p",
    "/admin/banking-admin/deposit_tokens",
    "/admin/banking-admin/deposit_tokens/new",
    "/admin/banking-admin/deposit_tokens/{deposit_token_id}/edit",
    "/admin/banking-admin/withdrawal-requests",
    "/admin/banking-admin/withdrawal-requests/{withdrawal_request_id}/edit",
    "/admin/banking-admin/trades",
    "/admin/banking-admin/trades/{ref_code}",
    "/admin/accounts-admin/reg_tokens",
    "/admin/accounts-admin/users",
    "/admin/accounts-admin/users/{username}/profile",
    "/admin/accounts-admin/users/{username}/user-group-memberships",
    "/admin/accounts-admin/users/{username}/user-group-memberships/{user_group_membership_id}/edit",
    "/admin/accounts-admin/users/{username}/permission-instances",
    "/admin/accounts-admin/users/{username}/permission-instances/{permission_instance_id}/edit",
    "/admin/sysconfig",
    "/admin/systools/user_groups",
    "/admin/systools/user_groups/{user_group_slug}",
    "/admin/systools/user_groups/{user_group_slug}/edit",
    "/admin/systools/user_groups/new",
    "/admin/systools/user_groups/{user_group_slug}/user-group-memberships",
    "/admin/systools/user_groups/{user_group_slug}/user-group-memberships/new",
    "/admin/systools/permissions",
    "/admin/systools/permissions/{permission_slug}",
    "/admin/systools/permissions/{permission_slug}/edit",
    "/admin/systools/permissions/new",
    "/admin/systools/permissions/{permission_slug}/permission-instances",
    "/admin/systools/permissions/{permission_slug}/permission-instances/new",
    "/admin/helper_modules/posts/{post_id}/edit",
    "/admin/helper_modules/posts/new",
    "/admin/helper_modules/log_viewer",
    "/admin/datalists/assets",
    "/admin/datalists/currencies",
    "/admin/datalists/payment_methods",
    "/admin/datalists/countries",
    
    // support
    "/support/home",
    "/support/feedback-reports",
    "/support/feedback-reports/new",
    "/support/feedback-reports/{ticket_code}",
    "/support/flagged-elements/users",
    "/support/flagged-elements/users/{username}",
    "/support/flagged-elements/trades",
    "/support/flagged-elements/trades/{ref_code}",
    "/support/chats",
    "/support/chats/{chat_id}"
];

foreach ($valid_paths as $path) {
    Route::view($path, 'scaffolding_app');
}

//Route::view('/{path?}', 'scaffolding_app')
//    ->where('path', '.*')
//    ->name('react');