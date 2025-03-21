<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RecipeRequest extends FormRequest
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
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'categories' => 'required',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'ingredients' => 'required|array|min:1',
            'ingredients.*.ingredient' => 'required|string|max:255',
            'steps' => 'required|array|min:1',
            'steps.*.instruction' => 'required|string',
            'steps.*.image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ];
    }
}
