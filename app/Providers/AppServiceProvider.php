<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Events\Dispatcher;
use TCG\Voyager\Facades\Voyager;
use App\Models\PersonalAccessToken;
use Laravel\Sanctum\Sanctum;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Sanctum::ignoreMigrations();
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        Sanctum::usePersonalAccessTokenModel(PersonalAccessToken::class);

       /*  Voyager::useModel('Menu', \App\Models\Menu::class);
        Voyager::useModel('MenuItem', \App\Models\MenuItem::class); */
        Voyager::useModel('ContestCategory', \App\Models\ContestCategory::class);
    }
}
