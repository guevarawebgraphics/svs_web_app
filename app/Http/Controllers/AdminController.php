<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;

class AdminController extends Controller
{
    public function index(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.index');
        }else{
            return redirect('/');
        }
    }

    public function location(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.location');
        }else{
            return redirect('/');
        }
    }

    public function task(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.task');
        }else{
            return redirect('/');
        }
    }

    public function projectlist(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.projectlist');
        }else{
            return redirect('/');
        }
    }

    public function assignproject(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.assignproject');
        }else{
            return redirect('/');
        }
    }
}
