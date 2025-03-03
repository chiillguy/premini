<?php

namespace App\Http\Controllers;

use App\Http\Requests\RecipeIngredientRequest;
use App\Models\Recipe;
use App\Models\Recipe_ingredient;
use Illuminate\Http\Request;

class RecipeIngredientController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $recipe_ingredient = Recipe_ingredient::with('recipe');

        return response()->json($recipe_ingredient);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(RecipeIngredientRequest $request)
    {
        $recipe_id = Recipe::latest()->first()->id;

        $ingredients = [];

        foreach ($request->ingredients as $ingredient) {
            $recipeIngredient = Recipe_ingredient::create([
                'recipe_id' => $recipe_id,
                'ingredient' => $ingredient['ingredient'],
                'quantity' => $ingredient['quantity']
            ]);

            $ingredients[] = $recipeIngredient;
        }
        
        return response()->json([
            'message' => 'Recipe ingredient created',
            'ingredients' => $ingredients
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Recipe_ingredient $recipe_ingredient)
    {
        return response()->json($recipe_ingredient->load('recipe'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Recipe_ingredient $request, Recipe_ingredient $recipe_ingredient)
    {
        $recipe_ingredient->update($request->validated());

        return response()->json([
            'message' => 'Recipe ingredient updated',
            'recipe_ingredient' => $recipe_ingredient->load('recipe')
        ], 202);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Recipe_ingredient $recipe_ingredient)
    {
        $recipe_ingredient->delete();

        return response()->json(['message' => 'Recipe ingredient deleted successfully'], 200);
    }
}
