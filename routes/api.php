<?php

use App\Models\Contestant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Resources\ContestantResource;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



/* Route::get('/contestants', function () {
    return ContestantResource::collection(Contestant::all());
}); */
Route::group(['namespace' => 'App\Http\Controllers\Api'], function()
{
    // globale ressource
    Route::get('banner', ['uses' => 'GlobalController@banner']);
    Route::post('vote', ['uses' => 'VoteController@vote']);
    Route::get('menu', ['uses' => 'GlobalController@menu']);
    Route::get('menu-footer', ['uses' => 'GlobalController@menuFooter']);
    Route::get('top-dix', ['uses' => 'RecipeController@topDix']);


    Route::resource('contestants', 'ContestantController');
    Route::resource('recipes', 'RecipeController');

    // guest register
    Route::post('register-guest', ['uses' => 'AuthController@guestRegister']);
    Route::post('social-login', ['uses' => 'SocialLoginController@login']);

    Route::group(['middleware' => ['auth:sanctum', 'can:isContestant']], function () {
        /**
         * Recipe Only for candidat Routes
         */
        Route::resource('contestant-recipes', 'ContestantRecipeController');
    });


    Route::group(['middleware' => ['guest']], function() {
        /**
         * Register Routes for candidat
         */
        Route::post('registration', ['uses' => 'AuthController@store']);
        Route::post('login', ['uses' => 'AuthController@mylogin']);
    });

    Route::group(['middleware' => ['auth:sanctum']], function () {
        /**
         * Logout Routes
         */
        Route::post('signout', ['uses' => 'AuthController@signOut'])->name('signout');
    });
});
