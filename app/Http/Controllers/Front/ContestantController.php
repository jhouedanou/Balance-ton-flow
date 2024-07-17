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
use App\Models\Recipe;
use App\Models\User;
use App\Models\Role;
use App\Models\UserVisit;

use Cookie;
use URL;
use Carbon\Carbon;


class ContestantController extends Controller
{


    public function candidat(Recipe $recipe, Request $request)
    {   
        
        $contestant=Contestant::where('slug', $request->slug)->first();
        $data = Recipe::with('category')->with('user')->where('user_id', $contestant->user_id)->first();

         // Get the current user's IP address
        $ipaddress = $request->ip();
        $data->update(['view_count' => $data->view_count + 1]);
      
        return view('front.contestants.candidat',compact(['data','contestant']));

    }



    /**
     * POST BRE(A)D - Store data.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
       
    }


    public function edit(Request $request, $id)
    {
        
    }

  

    public function destroy(Request $request, $id)
    {
     
    }

}

