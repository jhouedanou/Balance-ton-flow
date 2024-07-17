@extends('front.layouts.app-master')
@section('page_title', $page->title.' - Balance ton flow' )
@section('content')
<div class="container pt-5" style="padding-top: 5rem !important;" id="inner-page">

    <figure class="text-center">
        <blockquote class="blockquote">
            <h1 class="page-title title">
                {{ $page->title }}
            </h1>
        </blockquote>
        <figcaption class="blockquote-footer">
            <cite title="Source Title"></cite>
        </figcaption>
    </figure>

    <div class="feature">
        @if($page->image)
        <img src='{{ asset("storage/$page->image") }}' alt="" srcset="">
        @endif
    </div>
    <div class="page-content__wrap">
        <div class="pastor">

            {!! $page->body !!}
        </div>
    </div>
</div>
@endsection
@section('javascript')

@stop