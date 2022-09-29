<?php

use Illuminate\Support\Facades\Route;
use App\Models\_PrefItem;

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
    "/",
    "/offers",
    "/offers/{ref_code}",
    "/offers/{ref_code}/{currency_amount}",
    "/offers/new",
    "/learn",
    "/trades",
    "/trades/{ref_code}",
    "/my-offers",
    "/my-offers/{ref_code}",
    "/user_notifications",
    "/user_notifications/{id}",
    "/account/home",
    "/account/deposits/receive-funds",
    "/account/deposits/token-topup",
    "/account/withdrawals/send-funds",
    "/account/withdrawals/assisted",
    "/account/transactions",
    "/account_settings/email_addresses",
    "/account_settings/change_password",
    "/account_settings/display_settings",
    "/account_settings/avatar_image",
    "/account_settings/actions/user_group_memberships",
    "/account_settings/actions/permission_instances",
    "/account_settings/session_info/recent_sessions",
    "/account_settings/session_info/recent_sessions/{session_token}",
    "/account_settings/session_info/log_viewer",
    "/admin_dashboard/home",
    "/admin_dashboard/daily_users",
    "/admin_dashboard/asset_analytics",
    "/admin_dashboard/business_analytics",
    "/business_management/deposit_tokens",
    "/business_management/deposit_tokens/new",
    "/business_management/deposit_tokens/{deposit_token_id}/edit",
    "/business_management/withdrawal_requests",
    "/business_management/withdrawal_requests/{withdrawal_request_id}/edit",
    "/business_management/trades",
    "/business_management/trades/{ref_code}",
    "/user_management/reg_tokens",
    "/user_management/users",
    "/user_management/users/{username}/profile",
    "/user_management/users/{username}/user_group_memberships",
    "/user_management/users/{username}/user_group_memberships/{user_group_membership_id}/edit",
    "/user_management/users/{username}/permission_instances",
    "/user_management/users/{username}/permission_instances/{permission_instance_id}/edit",
    "/sysconfig/edit",
    "/systools/user_groups",
    "/systools/user_groups/{user_group_slug}",
    "/systools/user_groups/{user_group_slug}/edit",
    "/systools/user_groups/new",
    "/systools/user_groups/{user_group_slug}/user_group_memberships",
    "/systools/user_groups/{user_group_slug}/user_group_memberships/new",
    "/systools/permissions",
    "/systools/permissions/{permission_slug}",
    "/systools/permissions/{permission_slug}/edit",
    "/systools/permissions/new",
    "/systools/permissions/{permission_slug}/permission_instances",
    "/systools/permissions/{permission_slug}/permission_instances/new",
    "/systools/exportables",
    "/systools/exportables/{exportable_id}",
    "/systools/exportables/{exportable_id}/edit",
    "/systools/exportables/new",
    "/helper_modules/feedback_reports",
    "/helper_modules/feedback_reports/{ticket_code}",
    "/helper_modules/feedback_reports/{ticket_code}/edit",
    "/helper_modules/chats",
    "/helper_modules/chats/{chat_id}/messages",
    "/helper_modules/posts/{post_id}/edit",
    "/helper_modules/posts/new",
    "/helper_modules/log_viewer",
    "/datalists/assets",
    "/datalists/currencies",
    "/datalists/payment_methods",
    "/datalists/countries",
    "/signin",
    "/signup",
    "/recovery/generate_password_reset_token",
    "/recovery/reset_lost_password",
    "/recovery/reset_lost_password/{username}/{password_reset_token}",
    "/recovery/get_lost_username",
    "/verification/email_address",
    "/verification/email_address/{email_address_id}/{email_address_verification_token}",
    "/verification/phone_no",
    "/verification/phone_no/{phone_no_id}/{phone_no_verification_token}",
    "/about",
    "/contact",
    "/contact/form",
    "/privacy-policy",
    "/terms-of-service",
    "/blog_posts",
    "/blog_posts/{blog_post_id}",
    "/faq",
    "/local_outlets",
    "/payment_methods",
    "/partners/paywyze",
    "/partners/ecocash",
    "/partners/stanbic-bank",
    "/partners/mukuru"
];

foreach ($valid_paths as $path) {
    Route::view($path, 'scaffolding_app');
}

//Route::view('/{path?}', 'scaffolding_app')
//    ->where('path', '.*')
//    ->name('react');