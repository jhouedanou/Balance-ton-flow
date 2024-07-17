<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Resources\RecipeResource;
use Illuminate\Http\Response;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Recipe;
use App\Http\Requests\RecipeRequest;
use App\Http\Requests\RecipeUpdateRequest;
use Illuminate\Support\Facades\Validator;



class ContestantRecipeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
        $this->middleware('can:isContestant');
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(RecipeRequest $request): JsonResponse
    {
       // dd($request);

        $checkrecipe = Recipe::where('user_id', $request->user_id)
            ->where('category_id', $request->category_id)
            ->first();

        if ($checkrecipe) {
            return response()->json(['errors' => 'Already submitted'], 422);
           
        }
        $parsedUrl = parse_url($request->lien_video, PHP_URL_PATH);

        // Get the basename of the path (i.e., the last part after the final '/')
        $basename = basename($parsedUrl);

        // Optionally, you could also split the basename by '?' to ensure only the ID is extracted
        $lien = explode('?', $basename)[0];

        if ($request->lien_video) {

            $recipe = Recipe::create([
                /*  'images' => json_encode($imgData), */
                'user_id' => $request->user_id,
                'category_id' => $request->category_id,
                'lien_video' => $request->lien_video,
                'id_video' => $lien,
            ]);

            $resource = new RecipeResource($recipe);
            // Return a response
            return response()->json([
                'message' => 'Resource created successfully',
                'data' => $resource
            ], 201);
           
        }

        return response()->json(['errors' => 'Store faild, please try again'], 422);

       
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
     * Display the specified resource.
     *
     * @param  Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function edit(Recipe $recipe, $id): JsonResource
    {
        $recipe = Recipe::findOrFail($id);
        return new RecipeResource($recipe);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\RecipeUpdateRequest  $request
     * @param  \App\Models\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function update(RecipeUpdateRequest $request): JsonResponse
    {
        //dd($request);
        $lien = substr(strrchr(rtrim($request->lien_video, '/'), '/'), 1);

        // dd($request);

        if ($request->lien_video) {
            $recipe = Recipe::where('id', $request->id)
                ->where('user_id', $request->user_id)
                ->where('category_id', $request->category_id)
                ->first();

            if ($recipe) {
                $recipe->update([
                    'lien_video' => $request->lien_video,
                    'id_video' => $lien,
                ]);
                return new RecipeResource($recipe);
            }

        }
        // Update the recipe with the validated data
       
        // Return the updated recipe as a resource
        return response()->json(['errors' => 'Update faild'], 422);
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
