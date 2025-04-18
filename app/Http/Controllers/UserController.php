<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;

class UserController extends Controller
{
    public function index(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin == 0){
            return view('user.index');
        }else{
            return redirect('/');
        }
    }
}
