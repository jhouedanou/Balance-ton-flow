@extends('front.layouts.app-master')
@section('page_title', 'Accueil - Balance ton flow' )
@section('content')
<style>
.v-plus {
    position: absolute;
    right: 8px;
    top: 8px;
    cursor: pointer;
}

.v-plus i {
    font-size: 35px;
    color: rgb(255, 255, 255);
    text-shadow: black 1px 2px 6px;
}

.img-one {
    position: relative;
    width: 100%;
    max-width: 600px;
    /* Adjust max-width as needed */
    margin: auto;
    overflow: hidden;
    height: auto;
}

.img-one video {
    width: 100%;
    height: auto;
    display: block;
    object-fit: cover;
    /* Ensure video covers the container, you can change to 'contain' if needed */
}
</style>
@if(isset($banner))
<div class="container-fluid banner-home">
    <!-- <h1 id="tagline">Balance ton flow, choisis ton champion ! Qui a le meilleur flow ? À toi de décider ! Vote
        maintenant et fais monter ton rappeur préféré au sommet</h1> -->
    <div class="bubble-container">
        <?php
                    for ($i = 1; $i <= 25; $i++) {
                        echo "<div class=\"bubble-$i\"></div>";
                    }
                    ?>
    </div>
    <div class="container">
        <div class="row">

            <div class="col-md-8 left-banner">
                <!-- <img src='{{ asset("storage/$banner->image") }}' /> -->
                &nbsp;

            </div>
            <div class="col-md-4 right-banner">
                <img src="{!! url('assets/images/logo.png') !!}" alt="" class="busta" />

                <h2 class="text-center cat-title"> {!! $banner->category->name !!} </h2>
                <div class="text-center cat-desc"> {!! $banner->category->description !!} </div>
                <div class="middle">
                    <div id="timer" class="text-center"></div>

                </div>
            </div>
        </div>
    </div>


    <div class="scroll-down">
        <span class="mouse">
            <span class="mouse-wheel"></span>
        </span>
    </div>


</div>
@else
@php ($banner = \App\Models\Banner::where('active',1)->where('type','default')->first())
<div class="container-fluid banner">

    <div class='banner-home col-md-12'>
        <div class="left-banner">
            <!-- <img src='{{ asset("storage/$banner->image") }}' />
            -->
            <img src="" alt="">
        </div>

    </div>


</div>
@endif


<div id="twhe" class="container">
    <div class="row content">

        @if(isset($data))
        @php ($cat = \App\Models\ContestCategory::latest()->first())
        <h2 class="categorie-home">Choisis ton favori !</h2>
        @foreach($data as $member)
        @php ($first = json_decode($member->images, true))

        <div class="col-md-3 bloc-contestant">
            <div class="content-cand card">
                @if($first)

                @php ($votes =
                \App\Models\Vote::where('recipe_id',$member->id)->where('category_id',$cat->id)->pluck('votes')->sum())
                <div class="img-galerie">

                    @php ($slug = \App\Models\Contestant::where('user_id',$member->user_id)->first())

                    <div class="row" id="tiktok-video" style="position: relative">
                        <div class="float-photo">
                            <a href="{{ route('candidats' , $slug->slug) }}">
                                <img class="rounded-circle shadow-4-strong img-cover" alt="avatar2"
                                    src="{{ asset('storage/'.$slug->photo)}}" />
                            </a>
                        </div>


                        <div class="img-one">

                            <a href="{{ route('candidats' , $slug->slug) }}">


                                <video class="kv-preview-data file-preview-video" controls style="max-width: 100%;">
                                    <source src='{{ asset("storage/$first[0]") }}'>
                                </video>

                            </a>
                            <span class="v-plus vue-pop" data-link='{{ asset("storage/$first[0]") }}'><i
                                    class="fas fa-search-plus"></i></span>

                        </div>




                    </div>


                    <div class="cand-name">
                        <a href="{{ route('candidats' , $slug->slug) }}">{{ $member->user->name }}</a>
                    </div>

                </div>
                <div class="bouton btn-bloc eco">
                    <div class="row">
                        <!-- note jury -->
                        @php ($notejury = \App\Models\VoteJury::where('recipe_id',$member->id)
                        ->where('category_id',$cat->id)
                        ->where('owner_id',$member->user->id)
                        ->pluck('votes')->sum())
                        @if($notejury)

                        @php ($total_vote = \App\Models\Vote::where('category_id',$cat->id)->pluck('votes')->sum())

                        @php ($note_vote = ($votes*100)/$total_vote)
                        @php ($moyenne = $notejury + $note_vote / 2)

                        <div class="col-md-12 text-center moyenne" style="font-size: 11px">
                            Moy : <span class="counter-home float-right badge rounded-pill bg-success text-light">
                                {{round($moyenne, 2)}}
                            </span> / 100
                        </div>

                        @endif


                        <!-- fin note -->

                        @if (auth()->check())
                        @if (auth()->user()->isJury())
                        @php ($votejury = \App\Models\VoteJury::where('recipe_id',$member->id)
                        ->where('category_id',$cat->id)
                        ->where('owner_id',$member->user->id)
                        ->where('user_id',auth()->user()->id)
                        ->first())
                        <!--  Jury ID {{auth()->user()->id}}<br> -->

                        <div class="col-md-12">
                            <div class="editable-cell">
                                <div class="editable-field {{ $member->user->id }}">
                                    <label for="votejury">Note : </label>
                                    <input class="editable-input" type="text"
                                        value="{{ $votejury ? $votejury->votes : ''}}" name="votejury"
                                        placeholder="Cliquer sur le crayon" readonly required />
                                    <i class="fa fa-edit edit-button" data-id="{{ $member->user->id }}"></i>
                                    <i class="fa fa-check check-button" id="{{ $member->user->id }}"
                                        data-id="{{ $member->user->id }}"
                                        data-jury="{{ auth()->user() ? auth()->user()->id : '' }}"
                                        data-owner="{{ $member->user->id }}" data-recipe="{{ $member->id }}"
                                        data-category="{{ $member->category->id }}"></i>
                                </div>
                            </div>
                        </div>

                        @endif
                        @endif

                        <div class="col-md-6 ">
                            <div class="cpt-vote">
                                <span class="counter">
                                    <span class="counter-home float-right badge rounded-pill bg-info text-dark">
                                        <i class="fa fa-eye" aria-hidden="true"></i> {{ $member->view_count }}
                                    </span>

                                    @if($votes)

                                    <span class="counter-home rounded-pill counter-in  badge bg-warning text-dark"
                                        id="{{  $slug->slug }}">
                                        <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                        {{ $votes }}
                                    </span>
                                    {{-- Str::plural('Vote', $votes) --}}
                                    @else
                                    <span class="counter-home rounded-pill counter-in  badge bg-warning text-dark"
                                        id="{{  $slug->slug }}">
                                        <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                        O
                                    </span>
                                    @endif
                                </span>


                            </div>
                        </div>
                        <div class="col-md-6 fill-button">
                            <button data-id="{{ Auth::check() ? Auth::user()->id : '' }}"
                                data-owner="{{ $member->user->id }}" data-recipe="{{ $member->id }}"
                                data-category="{{ $member->category->id }}" data-slug="{{ $slug->slug }}"
                                class="voter cbtn btn " id="load"
                                data-loading-text="<i class='fas fa-circle-notch fa-spin'></i>">
                                <i class="fas fa-heart" aria-hidden="true"></i>
                                VOTER
                            </button>
                        </div>


                    </div>

                </div>


            </div>

        </div>
        @endif

        @endforeach

        @else
        <div class="no-recipe text-center">
            <p>Aucune recette pour le moment </p>
        </div>
        @endif


    </div>
</div>
@section('javascript')
<script>
$(document).ready(function() {
    $('.bloc-contestant').hover(
        function() {
            $('.bloc-contestant').not(this).addClass('dimmed');
        },
        function() {
            $('.bloc-contestant').removeClass('dimmed');
        }
    );

    $('.scroll-down').click(function() {
        $('html, body').animate({
            scrollTop: $('#twhe').offset().top
        }, 1000);
    });
});
</script>
@endsection


@stop