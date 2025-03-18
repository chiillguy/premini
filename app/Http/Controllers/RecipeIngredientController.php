<?php

namespace App\Http\Controllers;

use App\Http\Requests\RecipeIngredientRequest;
use App\Http\Requests\UpdateRecipeIngredientRequest;
use App\Http\Resources\RecipeIngredientResource;
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
        $ingredients = Recipe_ingredient::all();
        return response()->json([
            'message' => 'Success Fetching data',
            'data' => $ingredients
        ], 201);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(RecipeIngredientRequest $request)
    {
        // $request->validated();
        // $recipe_id = $request->recipe_id ?? Recipe::latest()->first()->id;

        // $ingredients = [];

        // foreach ($request->ingredients as $ingredient) {
        //     $recipeIngredient = Recipe_ingredient::create([
        //         'recipe_id' => $recipe_id,
        //         'ingredient' => $ingredient['ingredient'],
        //     ]);

        //     $ingredients[] = new RecipeIngredientResource($recipeIngredient);
        // }

        // return response()->json([
        //     'message' => 'Recipe ingredient created',
        //     'ingredients' => $ingredients
        // ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Recipe_ingredient $recipe_ingredient)
    {
        return new RecipeIngredientResource($recipe_ingredient);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRecipeIngredientRequest $request, $id)
    {
        // $recipe_ingredient = Recipe_ingredient::findOrFail($id);
        // $recipe_ingredient->update($request->validated());

        // return response()->json([
        //     'message' => 'Recipe ingredient updated',
        //     'recipe_ingredient' => new RecipeIngredientResource($recipe_ingredient)
        // ], 202);
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
