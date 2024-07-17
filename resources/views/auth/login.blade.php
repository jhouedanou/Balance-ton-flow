@extends('front.layouts.app-master')

@section('page_title','Login')


@section('content')
<div class="form-signin">
    <div class="container">
        <div class="row">
            <form method="post" action="{{ route('user-login') }}">

                <input type="hidden" name="_token" value="{{ csrf_token() }}" />


                <h1 class="h3 mb-3 fw-normal">Se connecter</h1>

                @include('front.layouts.partials.messages')

                <div class="form-group form-floating mb-3">
                    <input type="text" class="form-control" name="username" value="{{ old('username') }}"
                        placeholder="Email ou Identifiant" required="required" autofocus>
                    <label for="floatingName">Email ou Identifiant</label>
                    @if ($errors->has('username'))
                    <span class="text-danger text-left">{{ $errors->first('username') }}</span>
                    @endif
                </div>

                <div class="form-group form-floating mb-3">
                    <input type="password" class="form-control" name="password" value="{{ old('password') }}"
                        placeholder="Mote de passe" required="required">
                    <label for="floatingPassword">Mot de passe</label>
                    @if ($errors->has('password'))
                    <span class="text-danger text-left">{{ $errors->first('password') }}</span>
                    @endif
                </div>

                <div class="row mb-4">
                    <div class="fd-flex justify-content-center col-md-6">
                        <div class="form-check mb-3 mb-md-0">
                            <label for="remember">Se souvenir</label>
                            <input type="checkbox" name="remember" value="1">
                        </div>
                    </div>
                    <div class="d-flex justify-content-center col-md-6">
                        @if (Route::has('password.request'))
                        <a class="btn btn-link" href="{{ route('password.request') }}">
                            {{ __('Mot de passe oublié ?') }}
                        </a>
                        @endif
                    </div>

                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Connexion</button>
            </form>
            <div class="divider d-flex align-items-center my-4">
                <p class="text-center fw-bold mx-3 mb-0 text-muted">OU</p>
            </div>
            <fieldset class="border p-2">
                <legend class="float-none w-auto p-2"> <i>* La zone ci-dessous est réservée uniquement pour les
                        votants</i></legend>
                <!-- no need to add this  -->
                <!-- <p style="color:red; text-align:center; padding:10px 0px"></p> -->
                <form class="social social-links">
                    <div class="form-group connect">
                        <div class="connect-icon">
                            <!-- Lien de redirection vers Facebook -->
                            <a href="{{ route('socialite.redirect', 'facebook') }}" class="btn btn-facebook">
                                <img src="{!! url('assets/images/facebook.png') !!}" alt="" srcset="">
                            </a>
                        </div>
                        <div class="connect-icon">
                            <!-- Lien de redirection vers Google -->
                            <a href="{{ route('socialite.redirect', 'google') }}" class="btn btn-google">
                                <img src="{!! url('assets/images/google.png') !!}" alt="" srcset="">
                            </a>
                        </div>
                    </div>
                </form>


                <div class="text-end">

                    <a href="{{ route('registervotant') }}" class="btn">S'inscrire</a>
                </div>
            </fieldset>




        </div>

    </div>


</div>

@endsection