@extends('front.layouts.app-master')

@section('page_title','Error 403')

<style>
    .imgPreview img{
        width: 100px;
    }
</style>
@section('content')

<div class="error403">
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div class="text-wrapper">
                <div class="title" data-content="404">
                    ACCES INTERDIT
                </div>

                <div class="subtitle">
                    Oops, Vous n'êtes pas autorisé à accéder à cette page.
                </div>

                <div class="buttons">
                    <a class="button" href="{{ route('home') }}">Aller à l'accueil</a>
                </div>
            </div>

        </div>
    </div>

</div>
</div>

@endsection
