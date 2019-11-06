<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;
use App\Models\TaskModel;
use App\Models\UserAccount;

class AdminController extends Controller
{
    public function index(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            $view_project_percentage = DB::connection('mysql')->select("SELECT * from view_project_percentage ORDER BY created_at DESC");
        
            return view('admin.index', compact('view_project_percentage'));
        }else{
            return redirect('/');
        }
    }
}
