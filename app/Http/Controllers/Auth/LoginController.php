<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\User;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */

    protected function authenticated(Request $request, User $user){
        if($user->deleted == 0 && $user->account_type == "WEB"){
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
            if($user->deleted == 1){
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

    // protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

}
