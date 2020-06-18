<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});
Route::get('{any}', function () {
    return view('app');
})->where('any', '.*');

// Route::group(['middleware' => ['web', 'auth', 'roles']],function(){
//     // route terbuka semua user yang telah login (dc dan ho)
// 	Route::get('dashboard', 'Dashboard@index')->name('dashboard');
// 	// route khusus ho
// 	Route::group(['roles'=>'ho'],function(){
// 		Route::post('ustadz/store-nilai', 'Nilai@store')->name('store-nilai');
// 		Route::get('ustadz/create-jadwal', 'Jadwal@create')->name('create-jadwal');
// 		Route::post('ustadz/store-jadwal', 'Jadwal@store')->name('store-jadwal');
// 		Route::get('ustadz/data-jadwal', 'Jadwal@index')->name('jadwal');
// 		Route::get('ustadz/destroy-jadwal', 'Jadwal@destroy')->name('hapus-jadwal');
// 	});
// });

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('pembelianweb', 'PembelianController@index');