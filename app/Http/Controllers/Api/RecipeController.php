<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\RecipeResource;
use App\Http\Resources\VoteResource;
use App\Models\Contestant;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Recipe;
use App\Models\ContestCategory;
use App\Models\Vote;
use App\Http\Requests\RecipeRequest;
use App\Http\Requests\RecipeUpdateRequest;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Log;

class RecipeController extends Controller
{

  
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Recipe $recipe) : JsonResource
    {
        
        $categorycontest = ContestCategory::where('active', 1)->first();

        if (!$categorycontest) {
            return response()->json(['message' => 'No active contest category found.'], 404);
        }

        $recipes = Recipe::with(['user', 'category'])->get();
        if (!$recipes) {
            return response()->json(['errors' => 'Recipe not found.'], 404);
        }

        foreach ($recipes as $recipe) {
            $recipe->loadMissing('user', 'category');
            $recipe->contestant = Contestant::where('user_id', $recipe->user_id)->first();
            $vote = Vote::selectRaw("SUM(votes) as total_votes")
                ->where('category_id', $categorycontest->id)
                ->where('recipe_id', $recipe->id)
                ->groupBy('recipe_id')
                ->first();
            $recipe->total_votes = $vote ? $vote->total_votes : 0;
        }

        return RecipeResource::collection($recipes);
    }

 

    /**
     * Display the specified resource.
     *
     * @param  Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function show($id): JsonResponse
    {
        // Check if the recipe exists
        $recipe = Recipe::find($id);

        if (!$recipe) {
            return response()->json(['errors' => 'Recipe not found.'], 404);
        }

        try {
            // Load the contestant data manually
            $recipe->loadMissing('user', 'category');
            $recipe->contestant = Contestant::where('user_id', $recipe->user_id)->first();

            // Calculate total votes for the recipe
            $categorycontest = ContestCategory::where('active', 1)->first();
            if ($categorycontest) {
                $vote = Vote::selectRaw("SUM(votes) as total_votes")
                    ->where('category_id', $categorycontest->id)
                    ->where('recipe_id', $recipe->id)
                    ->groupBy('recipe_id')
                    ->first();
                $recipe->total_votes = $vote ? $vote->total_votes : 0;
            } else {
                $recipe->total_votes = 0;
            }

            // Return the RecipeResource
           //return new RecipeResource($recipe);
            $resource = new RecipeResource($recipe);
            // Return a response
            return response()->json([
                'message' => 'Recipe found successfully',
                'data' => $resource
            ], 201);
        } catch (ModelNotFoundException $e) {
            // Log the exception for debugging
            Log::error('Recipe not found: ' . $e->getMessage());

            // Return a JSON response with an error message
            return response()->json(['errors' => 'Recipe not found.'], 404);
        }
       
    }

    /**
     * Display the specified resource.
     *
     * @param  Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function topDix(Recipe $recipe): JsonResponse
    {
        // $categorycontest=ContestCategory::latest()->first();
        //$top = Vote::where('category_id', $categorycontest->id)->orderBy('votes','DESC')->take(10)->get();
        $categorycontest = ContestCategory::where('active', 1)->first();
        //dd($categorycontest);

        if ($categorycontest) {
            $topRecipes = Vote::selectRaw("SUM(votes) as total_votes, recipe_id")
                ->where('category_id', $categorycontest->id)
                ->groupBy('recipe_id')
                ->orderBy('total_votes', 'DESC')
                ->take($categorycontest->top)
                ->get()
                ->map(function ($vote, $index) {
                    //$recipe = Recipe::with(['user', 'category'])->find($vote->recipe_id);
                    $recipe = Recipe::with(['category'])->find($vote->recipe_id);
                    if ($recipe) {
                        $recipe->total_votes = $vote->total_votes;
                        $recipe->contestant = Contestant::where('user_id', $recipe->user_id)->first();
                        $recipe->rank = $index + 1; // Calcul du rang
                    }
                    return $recipe;
                })
                ->filter();

            return response()->json([
                'data' => $topRecipes,
                'message' => 'Vote display successfuly.',
            ], 201);
        } else {
            return response()->json(['message' => 'No active top 10 contest found.'], 404);
        }
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
