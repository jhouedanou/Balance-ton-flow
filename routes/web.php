<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::group(['namespace' => 'App\Http\Controllers\Front'], function()
{   
    /**
     * Front Routes not needed auth
     */
    Route::get('/', ['uses' => 'HomeController@index', 'as' => 'home']);
    Route::get('/top', ['uses' => 'TopDixController@index', 'as' => 'top']);

    Route::post('votes', ['uses' => 'VoteController@vote', 'as' => 'votes']);
    Route::post('votejury', ['uses' => 'VoteController@voteJury', 'as' => 'votejury']);
    Route::get('candidats/{slug}', ['uses' => 'ContestantController@candidat', 'as' => 'candidats']);
});

Route::group(
    [
    'namespace' => 'App\Http\Controllers\Front',
    'middleware' => ['auth']
    ]
    , function()
{   
    /**
     * Front Routes need auth
     */
    Route::get('add-recipe',  ['uses' => 'RecipeController@index',     'as' => 'add-recipe'])->middleware('can:isContestant');
    Route::post('add-recipe', ['uses'=>'RecipeController@store', 'as'=>'add-recipe.store']);
    Route::post('video', ['uses'=>'RecipeController@updateVideo', 'as'=>'video']);
    

    Route::get('edit-recipe/{id}',  ['uses' => 'RecipeController@edit',     'as' => 'edit-recipe'])->middleware('can:isContestant');
    Route::post('edit-recipe', ['uses'=>'RecipeController@editVideo', 'as'=>'edit-recipe.post']);
    Route::post('update-recipe', ['uses'=>'RecipeController@update', 'as'=>'update-recipe']);
});

Route::group(['namespace' => 'App\Http\Controllers\Auth'], function()
{   
    Route::group(['middleware' => ['guest']], function() {
        /**
         * Register Routes for candidat
         */
        Route::get('registration', ['uses' => 'AuthController@registration'])->name('register-user');
        Route::post('post-registration', ['uses' => 'AuthController@customRegistration'])->name('register.post'); 

         /**
         * Register Routes for votant
         */
        Route::get('registervotant', ['uses' => 'RegisterController@index'])->name('registervotant');
        Route::post('registervotant', ['uses' => 'RegisterController@create'])->name('registervotant');

        /**
         * Login Routes
         */
        Route::get('user-login', ['uses' => 'AuthController@index'])->name('user-login');
        Route::post('user-login', ['uses' => 'AuthController@customLogin'])->name('user-login'); 

    });

    Route::group(['middleware' => ['auth']], function() {
        /**
         * Logout Routes
         */
        Route::get('signout', ['uses' => 'AuthController@signOut'])->name('signout');
    });
});


Auth::routes();
//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

# Socialite URLs


Route::group(['namespace' => 'App\Http\Controllers\Front'], function()
{   
    /**
     * Front Routes not needed auth
     */

     // La page où on présente les liens de redirection vers les providers
    Route::get('login-register', ['uses' => 'SocialiteController@loginRegister', 'as' => 'login-register']);

    // La redirection vers le provider
    Route::get('redirect/{provider}', ['uses' => 'SocialiteController@redirect', 'as' => 'socialite.redirect']);

    // Le callback du provider
    Route::get('callback/{provider}', ['uses' => 'SocialiteController@callback', 'as' => 'socialite.callback']);
});

// page script
// Catch all page controller (place at the very bottom)
Route::group(['namespace' => 'App\Http\Controllers\Front'], function()
{  
    Route::get('{slug}', [
        'uses' => 'PagesController@getPage'
    ])->where('slug', '([A-Za-z0-9\-\/]+)');
});
