<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Response;
use Illuminate\Database\Eloquent\Collection;
use App\Models\Banner;
use App\Models\MenuItem;
use App\Models\Menu;

class GlobalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function banner() : JsonResponse
    {
        $banner = Banner::with('category')->where('active', 1)->first();

        if (!$banner) {
            return response()->json(['error' => 'No banner found'], 401);
        }
        return response()->json([
            'banner' => $banner,
            'message' => 'Banner display successfuly.',
        ], 201);
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function menu(): JsonResponse
    {
       $menu = MenuItem::with(['children', 'menu'])->where('menu_id',2)->orderBy('order','ASC')->get();
       //dd($menu);
        return response()->json([
            'banner' => $menu,
            'message' => 'Menu display successfuly.',
        ], 201);
    }
    public function menuFooter(): JsonResponse
    {
       $menu = MenuItem::with(['children', 'menu'])->where('menu_id',3)->orderBy('order','ASC')->get();
      
        return response()->json([
            'banner' => $menu,
            'message' => 'Menu display successfuly.',
        ], 201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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
