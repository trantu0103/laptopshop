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

Route::get('/', function () {
    return view('welcome');
});

Route::get('index', 'PageController@getIndex')->name('trang-chu');

Route::get('loai-san-pham/{type}', 'PageController@getLoaiSp')->name('loaisanpham');

Route::get('chi-tiet-san-pham/{id}', 'PageController@getChitiet')->name('chitietsanpham');

Route::get('lien-he', 'PageController@getLienHe')->name('lienhe');

Route::get('gioi-thieu', 'PageController@getGioiThieu')->name('gioithieu');

Route::get('add-to-cart/{id}', 'PageController@getAddToCart')->name('themgiohang');

Route::post('add-to-cart', 'PageController@postAddToCart')->name('themnhieugiohang');

Route::get('del-cart/{id}', 'PageController@getDelItemCart')->name('xoagiohang');

Route::get('dat-hang', 'PageController@getCheckout')->name('dathang');

Route::post('mua-hang', 'PageController@muahang')->name('muahang');

Route::get('dang-nhap', 'PageController@getLogin')->name('login');

Route::post('dang-nhap', 'PageController@postLogin')->name('postLogin');

Route::get('dang-ki', 'PageController@getRegister')->name('register');

Route::post('dang-ki', 'PageController@postRegister')->name('postRegister');

Route::get('dang-xuat', 'PageController@postLogout')->name('logout');

Route::get('search', 'PageController@search')->name('search');

Route::get('send-message', 'PageController@sendMess')->name('sendMessage');
