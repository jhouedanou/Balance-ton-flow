<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Mail;
use App\Models\Contestant;
use App\Models\ContestCategory;
use App\Models\User;
use App\Models\Role;
use App\Models\Vote;
use App\Models\VoteJury;
use Carbon\Carbon;


class VoteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function vote(Request $request) : JsonResponse
    {
       // dd($request);
        $today = Carbon::parse(Carbon::now())->format('Y-m-d H:i:s');
        $category = ContestCategory::where('active', 1)->first();

        $data = "";
        $vote = "";
        $status = "";
        $cptvote = "";

        if (($today >= $category->start_vote) && ($today <= $category->end_vote)) {
            $votant = Vote::where('user_id', $request->user_id)->where('recipe_id', $request->recipe_id)->where('category_id', $request->category_id)->first();
            if ($votant) {

                /*** CALCULE de temps de vote par jour calendaire */

                $startTime = Carbon::parse($votant->last_vote)->format('Y-m-d');
                $finishTime = Carbon::parse(Carbon::now())->format('Y-m-d');

                if ($startTime === $finishTime) {
                    $data = "Vous avez déja  voté";
                    $vote = 1;
                    $status = 200;
               
                } else {
                    $votant->update(
                        [
                            'votes' => $votant->votes + 1,
                            //'votes' => $votant->increment('votes'),
                            'last_vote' => $finishTime
                        ]
                    );
                    $nbrvotant = Vote::where('recipe_id', $request->recipe_id)->where('category_id', $request->category_id)->pluck('votes')->sum();
                    $data = "Vous avez voté avec succès";
                    $vote = 0;
                    $status = 200;
                    $cptvote = $nbrvotant;
                 

                }
            } else {
                $now = Carbon::parse(Carbon::now())->format('Y-m-d');
                /** il n'a jamais voté */
                $votant = Vote::create([
                    'ip' => request()->ip(),
                    'votes' => 1,
                    'category_id' => $request->category_id,
                    'recipe_id' => $request->recipe_id,
                    'user_id' => $request->user_id,
                    'last_vote' => $now,
                    'owner_id' => $request->owner_id
                ]);

                $nbrvotant = Vote::where('recipe_id', $request->recipe_id)->where('category_id', $request->category_id)->pluck('votes')->sum();
                $data = "Vous avez voté avec succès";
                $vote = 0;
                $status = 200;
                $cptvote = $nbrvotant;
             
            }
        } else {
            $data = "Les votes sont terminés";
            $vote = 2;
            $status = 200;
           
        }

        return response()
            ->json([
                'data' => $data,
                'vote' => $vote,
                'cptvote' => $cptvote,
                'status' => $status
            ]);


    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
