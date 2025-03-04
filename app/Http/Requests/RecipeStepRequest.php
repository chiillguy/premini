<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RecipeStepRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'recipe_id' => 'exists:recipes,id',
            'steps' => 'required|array',
            'steps.*.instruction' => 'required|string',
            'steps.*.image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048'
        ];
    }
}