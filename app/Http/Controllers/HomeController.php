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
        if(!empty(auth()->user()->id) && auth()->user()->is_admin == 1 && auth()->user()->is_admin == 2){
            return redirect('/admin/index');
        }else{
            return redirect('/user/index');
        }
    }
    public function admin(Request $req){
        return view('middleware')->withMessage("Admin");
    }
}
