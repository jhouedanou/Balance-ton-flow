<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Response;
use Illuminate\Database\Eloquent\Collection;
use App\Models\Contestant;
use App\Http\Resources\ContestantResource;
use App\Http\Requests\StoreContestantRequest;

class ContestantController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Contestant $contestant) : JsonResource
    {
       // return Contestant::all();
        return ContestantResource::collection(Contestant::limit(5)->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreContestantRequest $request): JsonResource
    {
        // Create a new contestant with the validated data
        $contestant = Contestant::create($request->validated());

        // Return the created contestant as a resource
        return new ContestantResource($contestant);
    }

    /**
     * Display the specified resource.
     *
     * @param  Contestant  $contestant
     * @return \Illuminate\Http\Response
     */
    public function show(Contestant $contestant): JsonResource
    {
        return new ContestantResource($contestant);
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
