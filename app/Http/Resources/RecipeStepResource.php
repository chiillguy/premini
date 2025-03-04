<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RecipeStepResource extends JsonResource
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
            'recipe' => $this->recipe->title,
            'step_no' => $this->step_no,
            'instruction' => $this->instruction,
            'image' => $this->image ? asset("storage/{$this->image}") : null,

        ];
    }
}
