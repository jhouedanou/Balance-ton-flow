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
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\RecipeRequest;
use Carbon\Carbon;
use Illuminate\Support\Str;


class RecipeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('can:isContestant');
    }
  
    public function index(Request $request)
    {
        $categorycontest = ContestCategory::where('active',1)->first();
        $user = Auth::user();
        

        $today = Carbon::parse(Carbon::now())->format('Y-m-d H:i:s');

        if ($categorycontest) {
            $recipe = Recipe::where([
                ["user_id", "=", $user->id],
                ["category_id", "=", $categorycontest->id]
            ])->first();

            //die($categorycontest->end_vote.''.$today);
    
            if ($recipe && ($today <= $categorycontest->end_recipe)) {
              
                return redirect()->route('edit-recipe', $recipe->id)
                ->with(['message' => 'Vous avez déja posté votre recette. Vous pouvez cependant effectuer des modifications']);
            }elseif (!$recipe) {
                return view('front.contestants.index', compact(['user','categorycontest']));
               }else{
                return view('front.contestants.index');
               }
    
           
        }else {
            return view('front.contestants.index');
        }

       
    }



    /**
     * POST BRE(A)D - Store data.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(RecipeRequest $request)
    {
       /*  $parsedUrl = parse_url($request->lien_video, PHP_URL_PATH);

       
        $basename = basename($parsedUrl);

       
        $lien = explode('?', $basename)[0];

        
          if($request->lien_video) {
            
              $recipe = Recipe::create([
               
                'user_id' => $request->user_id,
                'category_id' => $request->category_id,
                'lien_video' => $request->lien_video,
                'id_video' => $lien,
            ]);
    
            
            return response()->json(['success' => true, 'data' => $recipe]);
          }
  
        return response()->json(['error' => true]);
       */
      //dd($request);
        $imgData=[];
       
          if($request->hasfile('imageFile')) {
              foreach($request->file('imageFile') as $file)
              {
               /*  $fileName = $file->getClientOriginalName();
                $filePath = 'recipes' .DIRECTORY_SEPARATOR.date('FY').DIRECTORY_SEPARATOR.$fileName;
          
                $path = Storage::disk('public')->put($filePath, file_get_contents($file));
                $path = Storage::disk('public')->url($path);
                
                $imgData[] = $filePath;   */
                $originalName = $file->getClientOriginalName();
                // Extract the file extension
                $extension = $file->getClientOriginalExtension();

                // Remove the extension from the original name
                $nameWithoutExtension = str_replace('.' . $extension, '', $originalName);
                // Slugify the name without the extension
                $slugifiedName = Str::slug($nameWithoutExtension);

                // Reattach the extension
                $fileName = $slugifiedName . '.' . $extension;

                $filePath = 'recipes' . DIRECTORY_SEPARATOR . date('FY') . DIRECTORY_SEPARATOR . $fileName;

                $path = Storage::disk('public')->put($filePath, file_get_contents($file));
                $path = Storage::disk('public')->url($path);

                $imgData[] = $filePath;
              }

              

              $recipe = Recipe::create([
                'images' => json_encode($imgData),
                'user_id' => $request->user_id,
                'category_id' => $request->category_id,
            ]);
    
            // return redirect()->route('home');
           return response()->json(['success' => true, 'data' => $recipe, 'videos' => $imgData]);
          }
  
        return response()->json(['error' => true]);
        //return response()->json(['success' => true, 'data' => $data]);
    }


    public function edit(Request $request, $id)
    {
        $videos = Recipe::where('id', $id)->first();
        // dd($images);
         
         return view('front.contestants.edit',compact('videos'));
    }

    public function editVideo(Request $request)
    {
        $recipe1 = Recipe::where('id', $request->recipe_id)->first();
        $Array = json_decode($recipe1->images, true);

        // Use foreach loop to remove array element
        if ($recipe1) {
            foreach ($Array as $k => $val) {
                if ($k == $request->id) {
                    unset($Array[$k]);
                }
            }
            $recipe = Recipe::where('id', $request->recipe_id)
                ->update([
                    'images' => json_encode(array_values($Array)),
                    'lien_video' => $request->lien_video
                ]);


        }
        return response()->json(['success' => true]);
        /*  return redirect()->route('edit-recipe', $request->recipe_id)
                     ->with(['message' => 'Question answered.',
                             'question' => 'ok']);  */
    }
    public function update(Request $request)
    {
        
       // dd($request);
       /*  $lien = substr(strrchr(rtrim($request->lien_video, '/'), '/'), 1);
        if($request->lien_video) {
            $recipe = Recipe::where('id', $request->recipe_id)
            ->where('user_id', $request->user_id)
            ->where('category_id', $request->category_id)
            ->first();

            if ($recipe) {
            $recipe->update([
                'lien_video' => $request->lien_video,
                'id_video' => $lien,
            ]);
            } else {
            // Handle the case where the recipe was not found
            // You can throw an exception, return an error response, etc.
            }


            return response()->json(['success' => true]);
        }
  
          return response()->json(['error' => true]); */
        $imgData = [];

        if ($request->hasfile('imageFile')) {
            foreach ($request->file('imageFile') as $file) {
                /*  $fileName = $file->getClientOriginalName();
                 $filePath = 'recipes' .DIRECTORY_SEPARATOR.date('FY').DIRECTORY_SEPARATOR.$fileName;
           
                 $path = Storage::disk('public')->put($filePath, file_get_contents($file));
                 $path = Storage::disk('public')->url($path);
                 
                 $imgData[] = $filePath;   */
                $originalName = $file->getClientOriginalName();
                // Extract the file extension
                $extension = $file->getClientOriginalExtension();

                // Remove the extension from the original name
                $nameWithoutExtension = str_replace('.' . $extension, '', $originalName);
                // Slugify the name without the extension
                $slugifiedName = Str::slug($nameWithoutExtension);

                // Reattach the extension
                $fileName = $slugifiedName . '.' . $extension;

                $filePath = 'recipes' . DIRECTORY_SEPARATOR . date('FY') . DIRECTORY_SEPARATOR . $fileName;

                $path = Storage::disk('public')->put($filePath, file_get_contents($file));
                $path = Storage::disk('public')->url($path);

                $imgData[] = $filePath;
            }


            $recipe = Recipe::where('id', $request->recipe_id)
                ->where('user_id', $request->user_id)
                ->where('category_id', $request->category_id)
                ->first();

            if ($recipe) {
                $recipe->update([
                    'images' => json_encode($imgData),
                ]);
            }
          
            // return redirect()->route('home');
            return response()->json(['success' => true, 'data' => $recipe, 'videos' => $imgData]);
        }

        return response()->json(['error' => true]);

      
    }


    public function updateVideo(Request $request)
    {
          
            $lien = substr(strrchr(rtrim($request->lien_video, '/'), '/'), 1);
       
            if($request->lien_video) {
                $recipe = Recipe::where('id', $request->recipe_id)
                                ->where('user_id', $request->user_id)
                                ->where('category_id', $request->category_id)
                                ->first();
                $recipe->update([
                    'lien_video' => $request->lien_video,
                    'id_video' => $lien,
                ]);
    
                return response()->json(['success' => true]);
            }
      
              return response()->json(['error' => true]);

    }

  

    public function destroy(Request $request, $id)
    {
     
    }

}

