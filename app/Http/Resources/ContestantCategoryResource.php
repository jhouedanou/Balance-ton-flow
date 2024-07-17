<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ContestantCategoryResource extends JsonResource
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
            'slug' => $this->slug,
            'name'=> $this->name,
            'description'=> $this->description,
            'active'=> $this->active,
            'start_recipe'=> $this->start_recipe, 
            'end_recipe'=> $this->end_recipe,
            'start_vote'=> $this->start_vote,
            'end_vote'=> $this->end_vote,
            'created_at'=> $this->created_at,
        ];
    }
}
