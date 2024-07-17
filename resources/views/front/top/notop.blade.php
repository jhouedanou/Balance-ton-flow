@extends('front.layouts.app-master')

@section('page_title','Le Top du classement')

<style>
   
</style>
@section('content')

<div class="container"> 
    <div class="row">
        <div class="col-md-12">
             <h2 class="categorie-top text-center">Le TOP</h2>
             <div class="diver"></div>
             <hr>
             <p>Pas de top pour le moment </p>
        </div>
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