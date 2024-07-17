<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class VoteResource extends JsonResource
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
            'ip' => $this->id_video,
            'votes' => $this->images,
            'user_id' => $this->view_count,
            'category_id' => $this->lien_video,
            'recipe_id' => $this->lien_video,
            'created_at' => $this->created_at,
            'user' => new UserResource($this->user),
            'category' => new ContestantCategoryResource($this->category),
            'recipe' => $this->whenLoaded('recipe') ? new RecipeResource($this->recipe) : null,
        ];
    }
}
