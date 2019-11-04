<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(User $user, Request $request)
    {
        if(auth()->user()->is_admin == 1){
            return redirect('/admin/index');
        }else if(auth()->user()->is_admin == 2){
            return redirect('/admin/index');
        }else if(auth()->user()->is_admin == 0){
            return redirect('/user/index');
            // session()->flush();
            // $this->middleware('guest')->except('logout');
            // return redirect('/');
        }
    }
    public function admin(Request $req){
        return view('middleware')->withMessage("Admin");
    }
}
