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
    
    Route::get('/location', 'MainController@location');

    Route::get('/task', 'MainController@task');
    Route::post('/task/task_val', 'MainController@task_val')->name('task_val');
    Route::post('/task/task_save', 'MainController@task_save')->name('task_save');
    Route::get('/task/getTask', 'MainController@getTask')->name('getTask');
    Route::post('/task/session_success', 'MainController@session_success')->name('session_success');
    Route::post('/task/delete_task', 'MainController@delete_task')->name('delete_task');
    Route::post('/task/update_task_val', 'MainController@update_task_val')->name('update_task_val');
    Route::post('/task/update_task', 'MainController@update_task')->name('update_task');

    Route::get('/projectlist', 'MainController@projectlist');
    Route::get('/assignproject', 'MainController@assignproject');
});

Route::group(['middleware'=> ['auth']], function(){
    Route::get('/user/index', 'UserController@index');
}); 

Auth::routes();