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

// Route untuk auth via api passport
Route::post('login', 'Api\UserController@login');
Route::post('logout', 'Api\UserController@logout');
Route::post('register', 'Api\UserController@register');

// Kumpulan route yang diprotect oleh middleware api
Route::group(['middleware' => ['auth:api']], function(){
    // Route api produk
    Route::get('produk', 'ProdukController@index');
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

    // Route api dc
    Route::get('dc', 'DCController@index');
    Route::post('dc/store', 'DCController@store');
    Route::get('dc/edit/{id}', 'DCController@edit');
    Route::post('dc/update/{id}', 'DCController@update');
    Route::delete('dc/delete/{id}', 'DCController@destroy');

    // Route api harga, method create ada di register
    Route::get('akun', 'Api\UserController@index');
    Route::get('akun/edit/{id}', 'Api\UserController@edit');
    Route::post('akun/update/{id}', 'Api\UserController@update');
    Route::delete('akun/delete/{id}', 'Api\UserController@destroy');

    // Route api harga
    Route::get('harga', 'HargaController@index');
    Route::post('harga/store', 'HargaController@store');
    Route::get('harga/edit/{id}', 'HargaController@edit');
    Route::post('harga/update/{id}', 'HargaController@update');
    Route::delete('harga/delete/{id}', 'HargaController@destroy');

    // Route api harga
    Route::get('transaksi', 'TransaksiController@index');
    Route::post('transaksi/store', 'TransaksiController@store');
    // Route::get('harga/edit/{id}', 'HargaController@edit');
    // Route::post('harga/update/{id}', 'HargaController@update');
    // Route::delete('harga/delete/{id}', 'HargaController@destroy');
});

    Route::get('kode_dc', 'DCController@kode_dc');
    Route::get('id_produk', 'HargaController@id_produk');
    // Route untuk membuat kode sales baru
    Route::get('id_dc', 'SalesController@id_dc');
    Route::get('buat_kode_sales', 'SalesController@buat_kode_sales');