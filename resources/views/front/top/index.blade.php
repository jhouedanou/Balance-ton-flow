@extends('front.layouts.app-master')

@section('page_title','Le Top du classement')

<style>
   
</style>
@section('content')

<div class="container"> 
    <div class="row">
        <div class="col-md-12">
             <h2 class="categorie-top text-center">Le TOP {{$categorycontest->top}}</h2>
             <div class="diver"></div>
             <hr>
        </div>
    </div>
   
    <div class="row content players">

    @if(isset($top))

     
        @foreach($top as $data)
               @php ($member = \App\Models\Recipe::with('category')->with('user')->where('id', $data->recipe_id)->first())

               @if($member)

                @php ($first = json_decode($member->images, true))
                @php ($slug = \App\Models\Contestant::where('user_id',$member->user_id)->first())
                @php ($votes = \App\Models\Vote::where('recipe_id',$member->id)->where('category_id',$categorycontest->id)->pluck('votes')->sum())
                

               <!-- jury -->

                  @php ($notejury = \App\Models\VoteJury::where('recipe_id',$member->id)
                                                                        ->where('category_id',$categorycontest->id)
                                                                        ->where('owner_id',$member->user->id)
                                                                        ->pluck('votes')->sum())
                @if($notejury)

                        @php ($total_vote = \App\Models\Vote::where('category_id',$categorycontest->id)->pluck('votes')->sum())
                        
                        @php ($note_vote = ($votes*100)/$total_vote)
                        @php ($moyenne = $notejury + $note_vote / 2)
                @else
                @php ($moyenne = 0)
                @endif
               <!-- fin jury -->

              <div class="col-md-3 bloc-contestant player" message_count="{{ $moyenne }}">
                  <div class="content-cand card">
                        <div class="img-galerie">
                            
                                @php ($slug = \App\Models\Contestant::where('user_id',$member->user->id)->first())
                               
                                <div class="row" id="tiktok-video" style="position: relative">
                                        <div class="float-photo">
                                            <img class="rounded-circle shadow-4-strong img-cover" alt="avatar2" src="{{ asset('storage/'.$slug->photo)}}" />
                                        </div>
                                
                                      <div class="img-one"> 
                                           
                                            <a href="{{ route('candidats' , $slug->slug) }}">
                                        
                                               
                                                <video class="kv-preview-data file-preview-video" controls style="max-width: 100%;">
                                                <source src='{{ asset("storage/$first[0]") }}'  >
                                                </video>
                                                
                                            </a>
                                            <span class="v-plus vue-pop" data-link='{{ asset("storage/$first[0]") }}'><i class="fas fa-search-plus"></i></span>
                                            
                                        </div>
                               

                                </div>
                           
                            <div class="cand-name">
                                <a href="{{ route('candidats' , $slug->slug) }}">{{ $member->user->name }}</a>
                            </div>
                    
                        </div>
                     <div class="bouton btn-bloc eco">
                            <div class="row">
                               
                           <!--  {{ Auth::check() ? Auth::user()->id : '' }} -->
                           @if($notejury)
                                    <div class="col-md-6 text-center moyenne" style="font-size: 12px">
                                          Moy :  <span class="counter-home float-right badge rounded-pill bg-success text-light">  
                                                {{round($moyenne, 2)}} 
                                            </span> / 100
                                    </div> 

                            @endif
                                 <div class="col-md-{{$notejury ? '6' : '12'}} ">
                                    <div class="cpt-vote">
                                <span class="counter" style="font-size:12px"> 
                                     <span class="counter-home float-right badge rounded-pill bg-info text-dark"> 
                                        <i class="fa fa-eye" aria-hidden="true"></i>  {{ $member->view_count }}
                                      </span>
                                    
                                    @if($votes)
                                        
                                        <span class="counter-home rounded-pill counter-in  badge bg-warning text-dark" id="{{  $slug->slug }}">
                                            <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                            {{ $votes }}
                                        </span>
                                        {{-- Str::plural('Vote', $votes) --}}
                                    @else
                                    <span class="counter-home rounded-pill counter-in  badge bg-warning text-dark" id="{{  $slug->slug }}">
                                        <i class="fa fa-thumbs-up" aria-hidden="true" ></i>
                                        O
                                    </span>
                                    @endif
                                </span>
                                    
                                   
                                </div>
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

@endsection


@section('javascript')
<script>
    var players = $(".players .player");
var temp = players.sort(function(a,b){
  return parseInt($(b).attr("message_count")) - parseInt($(a).attr("message_count"));
});
$(".players").html(temp);
</script>
@stop