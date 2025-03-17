<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRecipeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|required|string',
            'categories' => 'sometimes|required',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'ingredients' => 'sometimes|array|min:1',
            'ingredients.*.id' => 'sometimes|exists:recipe_ingredients,id',
            'ingredients.*.ingredient' => 'required|string|max:255',
            'steps' => 'sometimes|array|min:1',
            'steps.*.id' => 'sometimes|exists:recipe_steps,id',
            'steps.*.instruction' => 'required|string',
            'steps.*.image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ];
    }
}
