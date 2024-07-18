<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;

class GenerateStaticSite extends Command
{
    protected $signature = 'generate:static';
    protected $description = 'Generate a static version of the site';

    public function handle()
    {
        $staticDir = public_path('static_site');
        File::deleteDirectory($staticDir);
        File::makeDirectory($staticDir, 0755, true);

        $routes = Route::getRoutes();

        foreach ($routes as $route) {
            if ($route->methods()[0] == 'GET' && !str_starts_with($route->uri(), '_')) {
                $path = $route->uri() == '/' ? 'index' : $route->uri();
                $content = $this->getContent($route->uri());
                
                $filePath = $staticDir . '/' . $path . '.html';
                $dirPath = dirname($filePath);
                
                if (!File::isDirectory($dirPath)) {
                    File::makeDirectory($dirPath, 0755, true);
                }
                
                File::put($filePath, $content);
                $this->info("Generated: $path");
            }
        }

        // Copy assets
        File::copyDirectory(public_path('css'), $staticDir . '/css');
        File::copyDirectory(public_path('js'), $staticDir . '/js');
        File::copyDirectory(public_path('images'), $staticDir . '/images');

        $this->info('Static site generated successfully!');
    }

    private function getContent($uri)
    {
        $response = app()->handle(app('request')->create(url($uri)));
        return $response->getContent();
    }
}