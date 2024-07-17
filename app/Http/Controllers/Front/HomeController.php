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
use App\Models\User;
use App\Models\ContestCategory;
use App\Models\Banner;
use App\Models\Recipe;


class HomeController extends Controller
{


    public function index(Request $request)
    {
        
       // $cat=ContestCategory::where('active', 1)->first();
        $cat=ContestCategory::latest()->first();
       
        
        if ($cat) {
            $banner=Banner::with('category')->where('active', 1)->where('category_id', $cat->id)->where('type','recipe')->first();
           // $data = Recipe::with('category')->with('user')->where('category_id', $cat->id)->whereNotNull('images')->get();
            $data = Recipe::with(['category', 'user'])
                ->where('category_id', $cat->id)
                ->whereNotNull('images')
                ->get();
           // dd($data);
            return view('front.home.index',compact(['data','banner']));
        }else {
            return view('front.home.index');
        }
        
        
    }


}

