<?php

namespace App\Http\Controllers\Front;
use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Mail;
use Illuminate\Routing\Controller;
use App\Models\Contestant;
use App\Models\ContestCategory;
use App\Models\User;
use App\Models\Role;
use App\Models\Vote;
use App\Models\VoteJury;
use Carbon\Carbon;



class VoteController extends Controller
{

    
    public function vote(Request $request)
    {
        $today = Carbon::parse(Carbon::now())->format('Y-m-d H:i:s');
        $category=ContestCategory::where('active', 1)->first();
       
        $data ="";
        $vote ="";
        $status ="";
        $cptvote = "";

        if (($today >= $category->start_vote) && ($today <= $category->end_vote)){
            $votant = Vote::where('user_id',$request->user_id)->where('recipe_id',$request->recipe_id)->where('category_id',$request->category_id)->first();
            if ( $votant) {
    
               /*** CALCULE de temps de vote par jour calendaire */
    
               $startTime = Carbon::parse($votant->last_vote)->format('Y-m-d');
               $finishTime = Carbon::parse(Carbon::now())->format('Y-m-d');
    
                    if ($startTime ===  $finishTime) {
                        $data ="Vous avez déja  voté";
                        $vote =1;
                        $status =200;
                          /*   return response()
                            ->json(['data' => "Vous avez déja  voté",
                                    'vote' => 1,
                                    'status' => 200 ]); */
                        
                       
                    }else{
                        $votant->update(
                            [
                            'votes' => $votant->votes + 1,
                            //'votes' => $votant->increment('votes'),
                             'last_vote' => $finishTime
                            ]
                        );
                        $nbrvotant = Vote::where('recipe_id',$request->recipe_id)->where('category_id',$request->category_id)->pluck('votes')->sum();
                        $data ="Vous avez voté avec succès";
                        $vote =0;
                        $status =200;
                        $cptvote =$nbrvotant;
                       /*  return response()
                        ->json(['data' => "Vous avez voté avec succès",
                                'vote' => 0,
                                'cptvote' =>  $nbrvotant,
                                //'slug' => $request->slug,
                                'status' => 200 ]); */
    
                    }        
            }else{
                $now = Carbon::parse(Carbon::now())->format('Y-m-d');
                /** il n'a jamais voté */
                $votant = Vote::create([
                    'ip'           => request()->ip(),
                    'votes'          => 1,
                    'category_id'       => $request->category_id,
                    'recipe_id' => $request->recipe_id,
                    'user_id'        => $request->user_id,
                    'last_vote'       => $now,
                    'owner_id'       => $request->owner_id
                ]);
    
                $nbrvotant = Vote::where('recipe_id',$request->recipe_id)->where('category_id',$request->category_id)->pluck('votes')->sum();
                $data ="Vous avez voté avec succès";
                $vote =0;
                $status =200;
                $cptvote =$nbrvotant;
                /* return response()
                ->json(['data' => "Vous avez voté avec succès",
                        'vote' => 0,
                        'cptvote' => $nbrvotant,
                        'status' => 200 ]); */
            } 
        }else{
            $data ="Les votes sont terminés";
            $vote =2;
            $status =200;
           /*  return response()
            ->json(['data' => "Les votes sont terminés",
                    'vote' => 2,
                    'status' => 200 ]); */
        }
       
        return response()
                ->json(['data' => $data,
                        'vote' => $vote,
                        'cptvote' => $cptvote,
                        'status' =>$status]);
        
     
    }

    public function voteJury(Request $request)
    {
       /*  $today = Carbon::parse(Carbon::now())->format('Y-m-d H:i:s');
        $category=ContestCategory::where('active', 1)->first(); */
       
        $data ="";
        $vote ="";
        $status ="";

        $note =0;
        $mistere = User::whereHas(
            'roles', function($q){
                $q->where('name', 'jury_mystere');
            }
        )->where('id',$request->user_id)->first();

        if($mistere){
            $note = $request->note /2;
        }else{
            $note = $request->note;
        }
        $votant = VoteJury::where('user_id',$request->user_id)
                                ->where('recipe_id',$request->recipe_id)
                                ->where('category_id',$request->category_id)
                                ->where('owner_id',$request->owner_id)
                                ->first();
            if ( $votant) {
                        $votant->update(
                            [
                            'votes' =>$note
                            ]
                        );

                        $data ="Mise à jour éffectué avec succès";
                        $vote =1;
                        $status =200;
                     
            }else{
                
                /** il n'a jamais voté */
                $votant = VoteJury::create([
                    'category_id'    => $request->category_id,
                    'recipe_id'     => $request->recipe_id,
                    'user_id'        => $request->user_id,
                    'votes'          => $note,
                    'owner_id'       => $request->owner_id
                ]);
    
                $data ="Vous avez voté avec succès";
                $vote =0;
                $status =200;
            } 
       
       
        return response()
                ->json(['data' => $data,
                        'vote' => $vote,
                        'status' =>$status]);
        
     
    }

}

