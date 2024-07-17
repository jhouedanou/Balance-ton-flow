@extends('front.layouts.app-master')

@section('page_title','Login')


@section('content')
<div class="form-signin">
    <div class="container">
        <div class="row">

            <div class="col-md-12">
                    <form method="post" action="{{ route('registervotant') }}" enctype="multipart/form-data">

                        <input type="hidden" name="_token" value="{{ csrf_token() }}" />

                        <h1 class="h3 mb-3 fw-normal">Inscription votant</h1>

                        <div class="form-row">
                        <div class="form-group col-md-6 col">

                            <div class="form-group form-floating mb-3">
                                <input type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="name@example.com"  autofocus>
                                <label for="floatingEmail">Email address</label>
                                @if ($errors->has('email'))
                                    <span class="text-danger text-left">{{ $errors->first('email') }}</span>
                                @endif
                            </div>
                            </div>
                            <div class="form-group col-md-6 col">
                            <div class="form-group form-floating mb-3">
                                <input type="text" class="form-control" name="first_name" value="{{ old('first_name') }}" placeholder="Prénoms" required="required" autofocus>
                                <label for="floatingPrenoms">Prénoms</label>
                                @if ($errors->has('first_name'))
                                    <span class="text-danger text-left">{{ $errors->first('first_name') }}</span>
                                @endif
                            </div>
                            </div>
                        </div>

                        <div class="form-row">
                        <div class="form-group col-md-6 col">

                            <div class="form-group form-floating mb-3">
                                <input type="text" class="form-control" name="last_name" value="{{ old('last_name') }}" placeholder="Nom" required="required" autofocus>
                                <label for="floatingNom">Nom</label>
                                @if ($errors->has('last_name'))
                                    <span class="text-danger text-left">{{ $errors->first('last_name') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group col-md-6 col">
                            <div class="form-group form-floating mb-3">
                                <input type="text" class="form-control" name="username" value="{{ old('username') }}" placeholder="Username" required="required" autofocus>
                                <label for="floatingName">Username</label>
                                @if ($errors->has('username'))
                                    <span class="text-danger text-left">{{ $errors->first('username') }}</span>
                                @endif
                            </div>
                        </div>
                        </div>

                        <div class="form-row">
                        <div class="form-group col-md-6 col">

                            <div class="form-group form-floating mb-3">
                                <input type="password" class="form-control" name="password" value="{{ old('password') }}" placeholder="Password" required="required">
                                <label for="floatingPassword">Password</label>
                                @if ($errors->has('password'))
                                    <span class="text-danger text-left">{{ $errors->first('password') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group col-md-6 col">
                            <div class="form-group form-floating mb-3">
                                <input type="password" class="form-control" name="password_confirmation" value="{{ old('password_confirmation') }}" placeholder="Confirm Password" required="required">
                                <label for="floatingConfirmPassword">Confirm Password</label>
                                @if ($errors->has('password_confirmation'))
                                    <span class="text-danger text-left">{{ $errors->first('password_confirmation') }}</span>
                                @endif
                            </div>
                        </div>
                        </div>

                        <button class="w-100 btn btn-lg btn-primary" type="submit">Register</button>
                      
            </div>

            <div class="text-end" style="margin-top:50px">
                        
                        <a href="{{ route('user-login') }}" class="btn">Se connecter</a>
             </div>
                    
        </div>                  
       
    </div>


</div>
  
@endsection
