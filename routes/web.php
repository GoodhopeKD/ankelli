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
Route::view('/{path?}', 'scaffolding_app')
    ->where('path', '.*')
    ->name('react');