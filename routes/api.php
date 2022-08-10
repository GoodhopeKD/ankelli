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
ini_set('serialize_precision',14);

// linking storage path to url path
if (!File::exists( public_path('storage') )){
    File::link( storage_path('app/public'), public_path('storage') );
}

// Default Route

Route::post('','App\Http\Controllers\API\__AuxController@default_route')->name('default_route');

Route::group([ 'namespace' => 'App\Http\Controllers\API', 'prefix' => '{session_token}' ], function() {
    
    // User authentication routes
    Route::post('users/signup', '_UserController@store')->name('users.signup');
    Route::post('users/signin', '_UserController@signin')->name('users.signin');

    // User recovery routes
    Route::post('users/recovery/generate_password_reset_token', '_VerificationTokenController@store')->name('users.generate_password_reset_token');
    Route::post('users/recovery/confirm_password_reset_token', '_VerificationTokenController@update')->name('users.confirm_password_reset_token');
    Route::post('users/reset_lost_password', '_UserController@reset_password')->name('users.reset_password');

    Route::group(['middleware' => 'auth:api'], function () {

        // User authentication routes
        Route::post('users/signout', '_UserController@signout')->name('users.signout');

        // User modification and deletion routes
        Route::apiResource('users', '_UserController')->only(['update'])->parameter('users', 'uid');

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
    });

    // Auth:null accessible routes
    Route::apiResource('datalists/currencies', '_CurrencyController')->only(['index'])->parameter('currencies', 'id');
    Route::apiResource('datalists/cities', '_CityController')->only(['index'])->parameter('cities', 'id');
    Route::apiResource('datalists/listing_categories', '_ListingCategoryController')->only(['show', 'index'])->parameter('listing_categories', 'id');
    Route::apiResource('offers', '_OfferController')->only(['show', 'index'])->parameter('offers', 'uid');
    Route::apiResource('events', '_EventController')->only(['show', 'index'])->parameter('events', 'uid');
    Route::apiResource('stores', '_StoreController')->only(['show', 'index'])->parameter('stores', 'uid');
    Route::apiResource('users', '_UserController')->only(['show', 'index'])->parameter('users', 'uid');
    Route::get('availability_check/{check_param_name}/{check_param_value}', '__AuxController@availability_check')->name('availability_check');

    // Auth:true accessible routes
    Route::group(['middleware' => 'auth:api'], function () {
        Route::apiResource('datalists/cities', '_CityController')->only(['store', 'update', 'destroy'])->parameter('cities', 'id');
        Route::apiResource('discount_codes', '_DiscountCodeController')->parameter('discount_codes', 'id');
        Route::apiResource('discount_instances', '_DiscountInstanceController')->parameter('discount_instances', 'id');
        Route::apiResource('email_addresses', '_EmailAddressController')->only(['store', 'index', 'destroy'])->parameter('email_addresses', 'id');
        Route::apiResource('feedback_reports', '_FeedbackReportController')->parameter('feedback_reports', 'uid');
        Route::apiResource('datalists/listing_categories', '_ListingCategoryController')->only(['store', 'update', 'destroy'])->parameter('listing_categories', 'id');
        Route::apiResource('offers', '_OfferController')->only(['store', 'update', 'destroy'])->parameter('offers', 'uid');
        Route::apiResource('trades', '_TradeController')->parameter('trades', 'uid');
        Route::apiResource('phone_nos', '_PhoneNumberController')->parameter('phone_nos', 'id');
        Route::apiResource('pinnings', '_PinningController')->only(['store', 'update', 'destroy'])->parameter('pinnings', 'id');
        Route::apiResource('pref_items', '_PrefItemController')->parameter('pref_items', 'id');
        Route::apiResource('events', '_EventController')->only(['store', 'update', 'destroy'])->parameter('events', 'uid');
        Route::post('files/upload', '_FileController@upload')->name('files.upload');
        Route::apiResource('files', '_FileController')->only(['show', 'update', 'destroy'])->parameter('files', 'id');
        Route::apiResource('links', '_LinkController')->parameter('links', 'id');
        Route::apiResource('logs', '_LogController')->only(['index'])->parameter('logs', 'id');
        Route::apiResource('notifications', '_NotificationController')->only(['index', 'update', 'destroy'])->parameter('notifications', 'id');
        Route::apiResource('stores', '_StoreController')->only(['show', 'update', 'destroy'])->parameter('stores', 'uid');
        Route::apiResource('systools/user_groups', '_UserGroupController')->parameter('user_groups', 'uid');
        Route::apiResource('systools/user_group_memberships', '_UserGroupMembershipController')->parameter('user_group_memberships', 'id');
    });

});