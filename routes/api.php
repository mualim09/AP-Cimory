<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('login', 'Api\UserController@login');
Route::post('logout', 'Api\UserController@logout');
Route::post('register', 'Api\UserController@register');

// Route api produk
Route::get('produk', 'ProdukController@index')->middleware('auth:api');
Route::post('produk/store', 'ProdukController@store');
Route::get('produk/edit/{id}', 'ProdukController@edit');
Route::post('produk/update/{id}', 'ProdukController@update');
Route::delete('produk/delete/{id}', 'ProdukController@destroy');

// Route api sales
Route::get('sales', 'SalesController@index');
Route::post('sales/store', 'SalesController@store');
Route::get('sales/edit/{id}', 'SalesController@edit');
Route::post('sales/update/{id}', 'SalesController@update');
Route::delete('sales/delete/{id}', 'SalesController@destroy');

Route::get('auth-check', function() {
    return Auth::check();
});
Route::group(['middleware' => 'auth:api'], function(){
    Route::post('details', 'API\UserController@details');
});