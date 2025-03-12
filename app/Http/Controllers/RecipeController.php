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
            $query->where('title', 'LIKE', "%{$search}%")->orWhere('description', 'LIKE', "%{$search}%");
        }

        return RecipeResource::collection($query->paginate(10));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(RecipeRequest $request)
    {
        // Buat Recipe
        $request->validated();

        $recipe = Recipe::create([
            'chef_id' => Auth::id(),
            'title' => $request->title,
            'description' => $request->description,
            'category_id' => $request->category_id,
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
                    'image' => $imagePath ? asset("storage/$imagePath") : null,
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
        Log::info('Request data:', $request->all());

        $recipe->update($request->validated());

        // Update Recipe
        $recipe->update($request->only(['title', 'description', 'category_id']));

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipes', 'public');
            $recipe->update(['image' => $imagePath]);
        }

        // Update Ingredients
        if ($request->has('ingredients')) {
            foreach ($request->ingredients as $ingredientData) {
                if (isset($ingredientData['id'])) {
                    // Update existing ingredient
                    $ingredient = Recipe_ingredient::find($ingredientData['id']);
                    if ($ingredient) {
                        $ingredient->update(['ingredient' => $ingredientData['ingredient']]);
                    }
                } else {
                    // Create new ingredient
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
                $imagePath = $stepData['image'] ?? null;

                if (!empty($stepData['image']) && is_file($stepData['image'])) {
                    $imagePath = $stepData['image']->store('recipe-steps', 'public');
                }

                if (isset($stepData['id'])) {
                    // Update existing step
                    $step = Recipe_step::find($stepData['id']);
                    if ($step) {
                        $step->update([
                            'instruction' => $stepData['instruction'],
                            'image' => $imagePath ? asset("storage/$imagePath") : $step->image
                        ]);
                    }
                } else {
                    // Create new step
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
