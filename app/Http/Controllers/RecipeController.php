<?php

namespace App\Http\Controllers;

use App\Http\Requests\RecipeRequest;
use App\Http\Requests\UpdateRecipeRequest;
use App\Http\Resources\RecipeResource;
use App\Models\Recipe;
use App\Models\Recipe_ingredient;
use App\Models\Recipe_step;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class RecipeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Recipe::with(['steps', 'ingredients']);

        if ($request->has('search')) {
            $search = $request->input('search');
            $query->where('title', 'LIKE', "%{$search}%");
        }

        return RecipeResource::collection($query->paginate(6));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Buat Recipe
        // $request->validated();


        try {
            $validatedData = $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'category' => 'required',
                'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
                'ingredients' => 'required|array|min:1',
                'ingredients.*.ingredient' => 'required|string|max:255',
                'steps' => 'required|array|min:1',
                'steps.*.instruction' => 'required|string',
                'steps.*.image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            ]);

            // return response()->json([
            //     'message' => 'Recipe created successfully',
            //     'data' => $validatedData
            // ], 201);
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }

        $recipe = Recipe::create([
            'chef_id' => Auth::id(),
            'title' => $request->title,
            'description' => $request->description,
            'category' => $request->category,
            'image' => $request->image,
        ]);

        // Simpan gambar jika ada
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipes', 'public');
            $recipe->image = $imagePath;
            $recipe->save();
        }


        // Simpan Recipe Ingredients
        if ($request->has('ingredients')) {
            foreach ($request->ingredients as $ingredient) {
                $recipe->ingredients()->create([
                    'ingredient' => $ingredient['ingredient'],
                ]);
            }
        }

        // Simpan Recipe Steps
        if ($request->has('steps')) {
            foreach ($request->steps as $index => $step) {
                $imagePath = null;
                if (!empty($step['image'])) {
                    $imagePath = $step['image']->store('recipe-steps', 'public');
                }

                $recipe->steps()->create([
                    'step_no' => $index + 1,
                    'instruction' => $step['instruction'],
                    'image' => $imagePath ?? null,
                ]);
            }
        }

        return response()->json([
            'message' => 'Recipe created successfully',
            'recipe' => new RecipeResource($recipe->load('steps', 'ingredients')),
        ], 201);
        // });
    }

    /**
     * Display the specified resource.
     */
    public function show(Recipe $recipe)
    {
        return new RecipeResource($recipe->load(['steps', 'ingredients']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRecipeRequest $request, Recipe $recipe)
    {
        try {
            $validatedData = $request->validate([
                'title' => 'sometimes|required|string|max:255',
                'description' => 'sometimes|required|string',
                'category' => 'sometimes|required',
                'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
                'ingredients' => 'sometimes|array|min:1',
                'ingredients.*.id' => 'nullable|exists:recipe_ingredients,id',
                'ingredients.*.ingredient' => 'required|string|max:255',
                'steps' => 'sometimes|array|min:1',
                'steps.*.id' => 'nullable|exists:recipe_steps,id',
                'steps.*.instruction' => 'required|string',
                'steps.*.image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            ]);
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }

        // Update Recipe
        $recipe->update($request->only(['title', 'description', 'category_id']));

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipes', 'public');
            $recipe->update(['image' => asset("storage/$imagePath")]);
        }

        // Update Ingredients
        if ($request->has('ingredients')) {
            foreach ($request->ingredients as $ingredientData) {
                if (!empty($ingredientData['id'])) {
                    $ingredient = Recipe_ingredient::find($ingredientData['id']);
                    if ($ingredient) {
                        $ingredient->update(['ingredient' => $ingredientData['ingredient']]);
                    }
                } else {
                    Recipe_ingredient::create([
                        'recipe_id' => $recipe->id,
                        'ingredient' => $ingredientData['ingredient']
                    ]);
                }
            }
        }

        // Update Steps
        if ($request->has('steps')) {
            foreach ($request->steps as $stepData) {
                $imagePath = null;
                if (!empty($stepData['image']) && $request->hasFile("steps.{$stepData['id']}.image")) {
                    $imagePath = $stepData['image']->store('recipe-steps', 'public');
                }

                if (!empty($stepData['id'])) {
                    $step = Recipe_step::find($stepData['id']);
                    if ($step) {
                        $step->update([
                            'instruction' => $stepData['instruction'],
                            'image' => $imagePath ? asset("storage/$imagePath") : $step->image
                        ]);
                    }
                } else {
                    Recipe_step::create([
                        'recipe_id' => $recipe->id,
                        'step_no' => Recipe_step::where('recipe_id', $recipe->id)->count() + 1,
                        'instruction' => $stepData['instruction'],
                        'image' => $imagePath ? asset("storage/$imagePath") : null
                    ]);
                }
            }
        }

        return response()->json([
            'message' => 'Recipe updated successfully',
            'recipe' => new RecipeResource($recipe)
        ], 202);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Recipe $recipe)
    {
        $recipe->delete();

        return response()->json(['message' => 'Recipe deleted successfully'], 200);
    }
}
