@extends('front.layouts.app-master')

@section('page_title', 'Candidat '.$data->user->name.' - Balance ton flow' )

<style>
    .imgPreview img{
        width: 100px;
    }
    .main-section{
            margin:0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 20px #c1c1c1;
        }
        .fileinput-remove,
        .fileinput-upload{
            display: none;
        }
</style>
@section('content')

<div class="recipe">
<div class="container mt-5">
    
        <h3 class="text-center mb-5"><sup>Candidat</sup> &nbsp; <span style="color: #006db5; text-transform:uppercase;">{{ $data->user->name }}</span></h3>
        @php ($cat = \App\Models\ContestCategory::where('active',1)->first())
               
                   <div class="cardio row">
                   
                         @php ($first = json_decode($data->images, true))
                         @php ($slug = \App\Models\Contestant::where('user_id',$data->user_id)->first())
                         @php ($votes = \App\Models\Vote::where('recipe_id',$data->id)->where('category_id',$cat->id)->pluck('votes')->sum())
                            <div class="col-md-7">
                                <div class="img-galerie">
                                    
                                    <div class="galery row">
                                               

                                    </div>
                                    @if(!empty($data->images))
                                   
                                    <div class="row" id="tiktok-video">
                                             
                                           <video class="kv-preview-data file-preview-video" controls style="max-width: 100%;">
                                                <source src='{{ asset("storage/$first[0]") }}'  >
                                                </video>
                                       </div>
                                   @else
                                       
                                   @endif


                                 
                                </div>
                            </div>

                            <div class="col-md-5">
                                    <div class="bouton btn-bloc eco">
                                    <div class="row">
                                            <div class="divider d-flex align-items-center my-4">
                                                 <img class="rounded-circle shadow-4-strong img-cover" alt="avatar2" src="{{ asset('storage/'.$slug->photo)}}" />
                                            </div>
                                        <div class="bio">
                                            <div class="name">
                                                 <h4>Nom</h4>
                                                <p>{{ $data->user->name }}</p>
                                            </div>
                                           
                                                <h4>Biographie</h4>
                                                <p> {{ $contestant->bio }}</p>
                                            </div>
                                            <div><hr></div>
                                            <div class="col-md-6 ">
                                                <div class="cpt-vote">
                                                    <span class="counter-in float-right badge rounded-pill bg-info text-dark"> 
                                                    <i class="fa fa-eye" aria-hidden="true"></i>  {{ $data->view_count }}
                                                     </span>
                                                    <span class="vote-spacer"></span>
                                                    @if($votes)
                                                    <span class="rounded-pill counter-in  badge bg-warning text-dark"  id="{{  $slug->slug }}">
                                                    <i class="fa fa-thumbs-up" aria-hidden="true"></i> {{ $votes }}
                                                    </span>
                                                        {{-- Str::plural('Vote', $votes) --}}
                                                    @else
                                                    <span class="rounded-pill badge bg-warning text-dark" id="{{  $slug->slug }}">
                                                    <i class="fa fa-thumbs-up" aria-hidden="true"></i>  O
                                                    </span>
                                                    @endif
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 fill-button">
                                                    <button 
                                                    data-id="{{ Auth::check() ? Auth::user()->id : '' }}" 
                                                    data-owner="{{ $data->user->id }}" 
                                                    data-recipe="{{ $data->id }}" 
                                                    data-category="{{ $data->category->id }}" 
                                                    data-slug="{{ $slug->slug }}" 
                                                    class="voter cbtn btn " 
                                                    id="load" 
                                                    data-loading-text="<i class='fas fa-circle-notch fa-spin'></i>">
                                                    <i class="fas fa-heart" aria-hidden="true"></i> 
                                                    VOTER
                                                </button>
                                            </div>

                                <div><hr></div>
                         <!-- note jury -->
                                 @php ($notejury = \App\Models\VoteJury::where('recipe_id',$data->id)
                                                                        ->where('category_id',$cat->id)
                                                                        ->where('owner_id',$data->user->id)
                                                                        ->pluck('votes')->sum())
                                @if($notejury)
                                    
                                    @php ($votes = \App\Models\Vote::where('recipe_id',$data->id)->where('category_id',$cat->id)->pluck('votes')->sum())
                                    @php ($total_vote = \App\Models\Vote::where('category_id',$cat->id)->pluck('votes')->sum())
                                            
                                    @php ($note_vote = ($votes*100)/$total_vote)
                                    @php ($moyenne = $notejury + $note_vote / 2)

                                <div class="col-md-12 text-center moyenne" style="font-size: 12px">
                                    <strong> Moyenne : </strong> <span class="counter-home float-right badge rounded-pill bg-success text-light">  
                                            {{round($moyenne, 2)}} 
                                        </span> / 100
                                </div> 

                                @endif
                               
                        <!-- fin note -->

                                            
                                    </div>
                                        
                                    </div> 
                         </div>
                     </div>
           
    </div>
 
</div>

@endsection


@section('javascript')

    @stop