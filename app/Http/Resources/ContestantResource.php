<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Response;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Resources\UserResource;

class ContestantResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'last_name' => $this->last_name,
            'first_name' => $this->first_name,
            'ville' => $this->ville,
            'quartier' => $this->quartier, 
            'cgu' => $this->cgu,
            'telephone' => $this->telephone,
            'photo' => $this->photo,
            'bio' => $this->bio,
            'slug' => $this->slug,
            'created_at' => $this->created_at,
            'user' => new UserResource($this->user),
        ];
    }
}
