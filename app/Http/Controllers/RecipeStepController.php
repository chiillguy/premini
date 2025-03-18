<?php

namespace App\Http\Controllers;

use App\Http\Requests\RecipeStepRequest;
use App\Http\Requests\UpdateRecipeStepRequest;
use App\Http\Resources\RecipeStepResource;
use App\Models\Recipe;
use App\Models\Recipe_step;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class RecipeStepController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $steps = Recipe_step::all();
        return response()->json([
            'message' => 'Success Fetching Data',
            'data' => $steps
        ], 201);
    }
 
    /**
     * Store a newly created resource in storage.
     */
    public function store(RecipeStepRequest $request)
    {
        // $request->validated();
        // $recipe_id = $request->recipe_id ?? Recipe::latest()->first()->id;
        // $steps = [];

        // $stepNumber = Recipe_step::where('recipe_id', $recipe_id)->count() + 1;

        // foreach ($request->steps as $step) {
        //     $imagePath = null;

        //     if (!empty($step['image'])) {
        //         $imagePath = $step['image']->store('recipe-steps', 'public');
        //     }

        //     $recipeStep = Recipe_step::create([
        //         'recipe_id' => $recipe_id,
        //         'step_no' => $stepNumber++,
        //         'instruction' => $step['instruction'],
        //         'image' => $imagePath ? asset("storage/$imagePath") : null
        //     ]);

        //     $steps[] = new RecipeStepResource($recipeStep);
        // }

        // return response()->json([
        //     'message' => 'Recipe steps created successfully',
        //     'steps' => $steps
        // ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Recipe_step $recipe_step)
    {
        return new RecipeStepResource($recipe_step);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRecipeStepRequest $request, $id)
    {
        // $recipe_step = Recipe_step::findOrFail($id);
        // $validatedData = $request->validated();

        // if ($request->hasFile('image')) {
        //     $imagePath = $request->file('image')->store('recipe-steps', 'public');
        //     $validatedData['image'] = asset("storage/$imagePath");
        // }

        // $recipe_step->update($validatedData);

        // return response()->json([
        //     'message' => 'Recipe step updated successfully',
        //     'recipe_step' => new RecipeStepResource($recipe_step)
        // ], 202);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Recipe_step $recipe_step)
    {
        $recipe_step->delete();

        return response()->json(['message' => 'Recipe step deleted successfully'], 200);
    }
}
