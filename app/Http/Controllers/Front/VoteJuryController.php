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



class VoteJuryController extends Controller
{

    /* public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('can:isJury');
    } */
  
    
    public function voteJury(Request $request)
    {
       /*  $today = Carbon::parse(Carbon::now())->format('Y-m-d H:i:s');
        $category=ContestCategory::where('active', 1)->first(); */
       
        $data ="";
        $vote ="";
        $status ="";

       
            $votant = VoteJury::where('user_id',$request->user_id)->where('recipe_id',$request->recipe_id)->where('category_id',$request->category_id)->first();
            if ( $votant) {
    
               /*** CALCULE de temps de vote par jour calendaire */
             
                        $votant->update(
                            [
                            'votes' => $request->note,
                            //'votes' => $votant->increment('votes')
                            ]
                        );
                        $data ="Mise à jour éffectué avec succès";
                        $vote =1;
                        $status =200;          
            }else{
                /** il n'a jamais voté */
                $votant = Vote::create([
                    'votes'          => $request->note,
                    'category_id'       => $request->category_id,
                    'recipe_id' => $request->recipe_id,
                    'user_id'        => $request->user_id,
                    'owner_id'       => $request->owner_id
                ]);
    
                $data ="Vous avez voté avec succès";
                $vote =1;
                $status =200;
            } 
       
       
        return response()
                ->json(['data' => $data,
                        'vote' => $vote,
                        'status' =>$status]);
        
     
    }

}

