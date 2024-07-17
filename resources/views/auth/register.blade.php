@extends('front.layouts.app-master')
@section('page_title','Registration')

@section('content')
<div class="form-signin damain">
    <form method="post" action="{{ route('register.post') }}" enctype="multipart/form-data">

        <input type="hidden" name="_token" value="{{ csrf_token() }}" />

        <h1 class="h3 mb-3 fw-normal">Inscription candidat</h1>

        <div class="form-row">
            <div class="form-group col-md-6 col">

                <div class="form-group form-floating mb-3">
                    <input type="email" class="form-control" name="email" value="{{ old('email') }}"
                        placeholder="name@example.com" required="required" autofocus>
                    <label for="floatingEmail">Email</label>
                    @if ($errors->has('email'))
                    <span class="text-danger text-left">{{ $errors->first('email') }}</span>
                    @endif
                </div>
            </div>
            <div class="form-group col-md-6 col">
                <div class="form-group form-floating mb-3">
                    <input type="text" class="form-control" name="first_name" value="{{ old('first_name') }}"
                        placeholder="Prénoms" required="required" autofocus>
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
                    <input type="text" class="form-control" name="last_name" value="{{ old('last_name') }}"
                        placeholder="Nom" required="required" autofocus>
                    <label for="floatingNom">Nom</label>
                    @if ($errors->has('last_name'))
                    <span class="text-danger text-left">{{ $errors->first('last_name') }}</span>
                    @endif
                </div>
            </div>
            <div class="form-group col-md-6 col">
                <div class="form-group form-floating mb-3">
                    <input type="text" class="form-control" name="username" value="{{ old('username') }}"
                        placeholder="Username" required="required" autofocus>
                    <label for="floatingName">Nom utilisateur</label>
                    @if ($errors->has('username'))
                    <span class="text-danger text-left">{{ $errors->first('username') }}</span>
                    @endif
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6 col">

                <div class="form-group form-floating mb-3">
                    <input type="password" class="form-control" name="password" value="{{ old('password') }}"
                        placeholder="Password" required="required">
                    <label for="floatingPassword">Mot de passe</label>
                    @if ($errors->has('password'))
                    <span class="text-danger text-left">{{ $errors->first('password') }}</span>
                    @endif
                </div>
            </div>
            <div class="form-group col-md-6 col">
                <div class="form-group form-floating mb-3">
                    <input type="password" class="form-control" name="password_confirmation"
                        value="{{ old('password_confirmation') }}" placeholder="Confirm Password" required="required">
                    <label for="floatingConfirmPassword">Confirmez le mot de passe</label>
                    @if ($errors->has('password_confirmation'))
                    <span class="text-danger text-left">{{ $errors->first('password_confirmation') }}</span>
                    @endif
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6 col">
                <div class="form-group form-floating mb-3">
                    <input type="text" class="form-control" name="ville" value="{{ old('ville') }}" placeholder="Ville"
                        required="required" autofocus>
                    <label for="floatingVille">Ville</label>
                    @if ($errors->has('ville'))
                    <span class="text-danger text-left">{{ $errors->first('ville') }}</span>
                    @endif
                </div>
            </div>
            <div class="form-group col-md-6 col">
                <div class="form-group form-floating mb-3">
                    <input type="text" class="form-control" name="quartier" value="{{ old('quartier') }}"
                        placeholder="Quartier" required="required" autofocus>
                    <label for="floatingQuartier">Quartier</label>
                    @if ($errors->has('quartier'))
                    <span class="text-danger text-left">{{ $errors->first('quartier') }}</span>
                    @endif
                </div>
            </div>
        </div>

        <div class="form-group form-floating mb-3">
            <input type="text" class="form-control" name="telephone" value="{{ old('telephone') }}"
                placeholder="Telephone" required="required" autofocus>
            <label for="floatingTelephone">Telephone</label>
            @if ($errors->has('telephone'))
            <span class="text-danger text-left">{{ $errors->first('telephone') }}</span>
            @endif
        </div>

        <div class="form-group form-floating mb-3">
            <input type="file" class="form-control" name="photo" value="{{ old('photo') }}" placeholder="Photo"
                required="required" autofocus>
            <label for="floatingPhoto">Photo</label>
            @if ($errors->has('photo'))
            <span class="text-danger text-left">{{ $errors->first('photo') }}</span>
            @endif
        </div>

        <div class="form-group mb-3">
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="bio" value="{{ old('bio') }}"
                placeholder="Biographie"></textarea>

            @if ($errors->has('bio'))
            <span class="text-danger text-left">{{ $errors->first('bio') }}</span>
            @endif
        </div>

        <div class="form-group form-floating mb-3">

            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="cgu"
                    required="required" value="{{ old('cgu') }}" autofocus>
                <label class="form-check-label" for="flexSwitchCheckDefault">J'accepte</label> -
                <a href="/terms-and-conditions"> Conditions générales de participation</a>
                @if ($errors->has('cgu'))
                <span class="text-danger text-left">{{ $errors->first('cgu') }}</span>
                @endif
            </div>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit" id="clickload">S'enregistrer</button>
        <div class="text-end">
            <a id="lmew" href="{{ route('user-login') }}" class="btn me-2">Se connecter</a>
        </div>


    </form>

</div>
@endsection


@section('javascript')

<script type="text/javascript">
$('#flexSwitchCheckDefault').change(function() {
    $(this).prop('checked');
    $(this).attr('value', 1);
})
</script>
<script type="text/javascript">
$(document).ready(function() {
    $('#clickload').click(function() {
        $("#overlay").fadeIn(300);
    })
});
</script>
@stop