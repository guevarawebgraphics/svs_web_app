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
    Route::post('/projectlist/project_info_task', 'MainController@project_info_task')->name('project_info_task');
    Route::post('/projectlist/project_info_pm', 'MainController@project_info_pm')->name('project_info_pm');
    Route::post('/projectlist/project_info_emp', 'MainController@project_info_emp')->name('project_info_emp');
    Route::post('/projectlist/project_dropdown', 'MainController@project_dropdown')->name('project_dropdown');
    Route::post('/projectlist/open_task_view_list', 'MainController@open_task_view')->name('open_task_view_list');
    Route::post('/projectlist/project_unselected', 'MainController@project_unselected')->name('project_unselected');
    Route::post('/projectlist/project_update_val', 'MainController@project_update_val')->name('project_update_val');
    Route::post('/projectlist/project_update', 'MainController@project_update')->name('project_update');
    Route::post('/projectlist/project_delete', 'MainController@project_delete')->name('project_delete');
    Route::post('/projectlist/project_import_excel','MainController@project_import_excel')->name('project_import_excel');
    Route::post('/projectlist/project_import_excel_update','MainController@project_import_excel_update')->name('project_import_excel_update');


    Route::get('/assignproject', 'MainController@assignproject');

    Route::get('/retrack_task', 'MainController@retrack_task');
    Route::post('/retrack_task/retrack_task', 'MainController@retrack')->name('retrack_task');

    Route::get('/retrack_project', 'MainController@retrack_project');
    Route::post('/retrack_task/retrack_project', 'MainController@retrack')->name('retrack_project');

    Route::get('/member', 'MainController@member');
    Route::post('/val_new_member', 'MainController@val_new_member')->name('val_new_member');
    Route::post('/new_member', 'MainController@new_member')->name('new_member');

    Route::get('/retrack_member', 'MainController@retrack_member');
    Route::post('/retrack_member/retrack_member', 'MainController@retrack')->name('retrack_member');

    Route::get('/retrack_web_users', 'MainController@retrack_web_users');
    Route::post('/retrack_web_users/retrack_web_users', 'MainController@retrack')->name('retrack_web_users');

    Route::get('/user_management', 'MainController@user_management');
    Route::post('/user_management/val_web_user', 'MainController@web_user_val')->name('val_web_user');
    Route::post('/user_management/new_web_user', 'MainController@web_user')->name('new_web_user');
    Route::post('/user_management/val_delete_web_user', 'MainController@web_user_val')->name('val_delete_web_user');
    Route::post('/user_management/delete_web_user', 'MainController@web_user')->name('delete_web_user');
    Route::post('/user_management/val_edit_web_user', 'MainController@web_user_val')->name('val_edit_web_user');
    Route::post('/user_management/edit_web_user', 'MainController@web_user')->name('edit_web_user');

    Route::get('/account_settings', 'MainController@account_settings');
    Route::post('/account_settings/account_settings_val', 'MainController@account_settings_val')->name('account_settings_val');
    Route::post('/account_settings/account_settings_update', 'MainController@account_settings_update')->name('account_settings_update');

    // ------------------------------------------------------------------------//
    // This section all reusable codes will be commented for future purposes   //
    // ------------------------------------------------------------------------//
    // Unused routes
    // Route::post('/projectlist/project_info', 'MainController@project_info')->name('project_info');
});

Route::group(['middleware'=> ['auth']], function(){
    
    Route::get('/dashboard', 'MainController@index');
    Route::post('/dashboard/task_view', 'MainController@project_view')->name('task_view');
    Route::post('/dashboard/pm_view', 'MainController@project_view')->name('pm_view');
    Route::post('/dashboard/emp_view', 'MainController@project_view')->name('emp_view');
    Route::post('/dashboard/act_view', 'MainController@project_view')->name('act_view');
    Route::post('/dashboard/stake_view', 'MainController@project_view')->name('stake_view');
    Route::post('/dashboard/customer_view', 'MainController@project_view')->name('customer_view');
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
    
    Route::post('/projectlist/project_info_task', 'MainController@project_info_task')->name('project_info_task');
    Route::post('/projectlist/project_info_pm', 'MainController@project_info_pm')->name('project_info_pm');
    Route::post('/projectlist/project_info_emp', 'MainController@project_info_emp')->name('project_info_emp');
    Route::post('/projectlist/project_info_stakeholder', 'MainController@project_info_stakeholder')->name('project_info_stakeholder');
    Route::post('/projectlist/project_info_customer', 'MainController@project_info_customer')->name('project_info_customer');
    Route::post('/projectlist/project_dropdown', 'MainController@project_dropdown')->name('project_dropdown');
    Route::post('/projectlist/open_task_view_list', 'MainController@open_task_view')->name('open_task_view_list');
    Route::post('/projectlist/project_unselected', 'MainController@project_unselected')->name('project_unselected');
    Route::post('/projectlist/project_update_val', 'MainController@project_update_val')->name('project_update_val');
    Route::post('/projectlist/project_update', 'MainController@project_update')->name('project_update');
    Route::post('/projectlist/project_delete', 'MainController@project_delete')->name('project_delete');

    Route::get('/assignproject', 'MainController@assignproject');

    // ------------------------------------------------------------------------//
    // This section all reusable codes will be commented for future purposes   //
    // ------------------------------------------------------------------------//
    //Unused Routes
    // Route::get('/user/index', 'UserController@index');
}); 

Auth::routes();