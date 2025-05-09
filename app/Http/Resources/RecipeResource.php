<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RecipeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'chef' => $this->chef->name,
            'category' => $this->category,
            'title' => $this->title,
            'description' => $this->description,
            'image' => $this->image ? asset("storage/{$this->image}") : null,
            'created_at' => $this->created_at,
            'ingredients' => RecipeIngredientResource::collection($this->ingredients),
            'steps' => RecipeStepResource::collection($this->steps),
        ];
    }
}
