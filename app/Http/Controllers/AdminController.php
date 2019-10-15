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
            return view('admin.index');
        }else{
            return redirect('/');
        }
    }
}
