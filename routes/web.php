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
    Route::post('/admin/task/task_val', 'AdminController@task_val')->name('task_val');
    Route::post('/admin/task/task_save', 'AdminController@task_save')->name('task_save');
    Route::get('/admin/task/getTask', 'AdminController@getTask')->name('getTask');
    Route::post('/admin/task/session_success', 'AdminController@session_success')->name('session_success');
    Route::post('/admin/task/delete_task', 'AdminController@delete_task')->name('delete_task');
    Route::post('/admin/task/update_task_val', 'AdminController@update_task_val')->name('update_task_val');
    Route::post('/admin/task/update_task', 'AdminController@update_task')->name('update_task');

    Route::get('/admin/projectlist', 'AdminController@projectlist');
    Route::get('/admin/assignproject', 'AdminController@assignproject');
});

Route::group(['middleware'=> ['auth']], function(){
    Route::get('/user/index', 'UserController@index');
}); 

Auth::routes();