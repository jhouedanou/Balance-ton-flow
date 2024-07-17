<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RecipeResource extends JsonResource
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
            'id_video' => $this->id_video,
            'images' => $this->images,
            'view_count' => $this->view_count,
            'lien_video' => $this->lien_video,
            'created_at' => $this->created_at,
            'user' => new UserResource($this->user),
            'category' => new ContestantCategoryResource($this->category),
            'contestant' => $this->whenLoaded('contestant') ? new ContestantResource($this->contestant) : null,
            'total_votes' => $this->total_votes,
            'rank' => $this->rank,
        ];
    }
}
