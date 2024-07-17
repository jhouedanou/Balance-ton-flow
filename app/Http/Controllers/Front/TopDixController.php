<?php

namespace App\Http\Controllers\Front;
use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Mail;
use Illuminate\Routing\Controller;
use App\Models\ContestCategory;
use App\Models\Recipe;
use App\Models\Vote;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\RecipeRequest;
use Carbon\Carbon;


class TopDixController extends Controller
{

  
    public function index(Request $request)
    {
        $categorycontest = ContestCategory::where('active',1)->first();
       // $categorycontest=ContestCategory::latest()->first();
        //$top = Vote::where('category_id', $categorycontest->id)->orderBy('votes','DESC')->take(10)->get();
       
        if ($categorycontest) {
            $top = Vote::selectRaw("SUM(votes) as votes , recipe_id")
            ->where('category_id', $categorycontest->id)
            ->groupBy('recipe_id')
            ->orderBy('votes','DESC')
            ->take($categorycontest->top)
            ->get();

            return view('front.top.index', compact(['top','categorycontest'])); 
        }else{
            return view('front.top.notop'); 
        }

        
    }


    public function destroy(Request $request, $id)
    {
     
    }

}

