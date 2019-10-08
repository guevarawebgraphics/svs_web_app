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

Route::get('/','HomeController@index');
    
Route::group(['middleware'=> ['admin']], function(){
    Route::get('/admin/index', 'AdminController@index');
    Route::get('/admin/location', 'AdminController@location');
    Route::get('/admin/task', 'AdminController@task');
    Route::get('/admin/projectlist', 'AdminController@projectlist');
    Route::get('/admin/assignproject', 'AdminController@assignproject');
});

Route::group(['middleware'=> ['auth']], function(){
    Route::get('/user/index', 'UserController@index');
}); 

Auth::routes();