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
    Route::get('/dashboard', 'MainController@index');
    Route::post('/dashboard/task_view', 'MainController@project_view')->name('task_view');
    Route::post('/dashboard/pm_view', 'MainController@project_view')->name('pm_view');
    Route::post('/dashboard/emp_view', 'MainController@project_view')->name('emp_view');
    Route::post('/dashboard/open_task_view', 'MainController@open_task_view')->name('open_task_view');
    
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
    Route::post('/projectlist/new_project', 'MainController@new_project')->name('new_project');
    Route::post('/projectlist/save_project', 'MainController@save_project')->name('save_project');
    Route::post('/projectlist/session_success', 'MainController@session_success')->name('session_success');
    Route::post('/projectlist/project_info', 'MainController@project_info')->name('project_info');
    Route::post('/projectlist/project_info_task', 'MainController@project_info_task')->name('project_info_task');
    Route::post('/projectlist/project_info_pm', 'MainController@project_info_pm')->name('project_info_pm');
    Route::post('/projectlist/project_info_emp', 'MainController@project_info_emp')->name('project_info_emp');
    Route::post('/projectlist/project_dropdown', 'MainController@project_dropdown')->name('project_dropdown');
    Route::post('/projectlist/project_unselected', 'MainController@project_unselected')->name('project_unselected');
    Route::post('/projectlist/project_update_val', 'MainController@project_update_val')->name('project_update_val');
    Route::post('/projectlist/project_update', 'MainController@project_update')->name('project_update');
    Route::post('/projectlist/project_delete', 'MainController@project_delete')->name('project_delete');

    Route::get('/assignproject', 'MainController@assignproject');
});

Route::group(['middleware'=> ['auth']], function(){
    Route::get('/user/index', 'UserController@index');
}); 

Auth::routes();