@extends('layouts.app_login')

@section('content')
<div class="container" style="margin-top:5em;">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <img class="img-fluid" style="width:100%" src="{{ asset('/img/svs2.png') }}">
            <div class="card">
                <div class="card-header white-text text-center py-4 svs-header"><b>{{ __('Project Management Web Application Login') }}</b></div>
                
                <div class="card-body px-lg-5 pt-0">
                    <br>
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <!-- Email -->
                        <div class="md-form">
                            <input type="email" id="materialLoginFormEmail" class="form-control @error('email') is-invalid @enderror" name="email" required>
                            <label for="materialLoginFormEmail">{{ __('E-Mail Address') }}</label>

                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>


                        {{-- <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div> --}}

                        <!-- Password -->
                        <div class="md-form">
                            <input type="password" id="materialLoginFormPassword" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">
                            <label for="materialLoginFormPassword">{{ __('Password') }}</label>

                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        {{-- <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div> --}}
                        <div>
                        <!-- Remember me -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember" name="remember" {{ old('remember') ? 'checked' : '' }}>
                            <label class="custom-control-label" for="defaultLoginFormRemember">{{ __('Remember Me') }}</label>
                        </div>
                        </div>
                        
                        <!-- Sign in button -->
                        <button class="btn btn-block my-4 white-text svs-btn" type="submit">{{ __('Login') }}</button>

                        @if (Route::has('password.request'))
                        <div class="svs-link">
                            <!-- Forgot password -->
                            <a class="btn-link" href="{{ route('password.request') }}">
                                {{ __('Forgot Your Password?') }}
                            </a>
                        </div>
                        @endif
                        {{-- <div class="form-group row">
                            <div class="col-md-6 offset-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div> --}}

                        {{-- <div class="form-group row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Login') }}
                                </button>

                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                            </div>
                        </div> --}}
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



@endsection
