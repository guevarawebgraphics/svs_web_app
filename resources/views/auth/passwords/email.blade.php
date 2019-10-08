@extends('layouts.app_login')

@section('content')
<div class="container" style="margin-top:5em;">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <a href="{{ env('APP_URL') }}"> <img class="img-fluid" style="width:100%" src="{{ asset('/img/svs2.png') }}"> </a>
            <div class="card">
                <div class="card-header white-text text-center py-4 svs-header"><b>{{ __('Project Management Web Application Reset Password') }}</b></div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form method="POST" action="{{ route('password.email') }}">
                        @csrf

                        <!-- Email -->
                        <div class="md-form container">
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
                        <div class="text-center">
                            <button type="submit" class="btn svs-btn white-text">
                                {{ __('Send Password Reset Link') }}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
