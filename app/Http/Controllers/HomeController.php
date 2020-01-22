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
        $user_record = DB::connection('mysql')->select("SELECT * FROM users WHERE id = '".auth()->user()->id."'");

        if($user_record[0]->deleted == 0 && $user_record[0]->account_type == "WEB"){
            
            if(auth()->user()->is_admin == 1){
                return redirect('/dashboard');
            }else if(auth()->user()->is_admin == 2){
                return redirect('/dashboard');
            }else if(auth()->user()->is_admin == 0){
                return redirect('/dashboard');
                // session()->flush();
                // $this->middleware('guest')->except('logout');
                // return redirect('/');
            }
        }else{
            if($user_record[0]->deleted == 1){
                session()->flush();
                $this->middleware('guest')->except('logout');
                return redirect('/login?error=deleted')->with(['email'=>'Account does not recognized']);
            }else{
                session()->flush();
                $this->middleware('guest')->except('logout');
                return redirect('/login?error=forbidden')->with(['email'=>'Account not allowed to access']);
            }
        }
        
    }
    public function admin(Request $req){
        return view('middleware')->withMessage("Admin");
    }
}
