<?php

namespace App\Http\Controllers;

use App\Http\Requests\RecipeReviewRequest;
use App\Models\Recipe_review;
use Illuminate\Http\Request;

class RecipeReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $recipe_review = Recipe_review::with(['user', 'recipe'])->get();

        return response()->json($recipe_review);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(RecipeReviewRequest $request)
    {
        $recipe_review = Recipe_review::create($request->validated());

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipe-reviews', 'public');

            $recipe_review->update(['image' => $imagePath]);
        }

        return response()->json([
            'message' => 'Recipe review created',
            'photo_url' => isset($imagePath) ? asset("storage/$imagePath") : null,
            'recipe_review' => $recipe_review->load(['user', 'recipe'])
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Recipe_review $recipe_review)
    {
        return response()->json($recipe_review->load(['user', 'recipe']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(RecipeReviewRequest $request, Recipe_review $recipe_review)
    {
        $recipe_review->update($request->validated());

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipe-reviews', 'public');
            $recipe_review->update(['image' => $imagePath]);
        }

        return response()->json([
            'message' => 'Recipe review updated',
            'recipe_review' => $recipe_review->load(['user', 'recipe'])
        ], 202);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Recipe_review $recipe_review)
    {
        $recipe_review->delete();

        return response()->json(['message' => 'Recipe review deleted successfully'], 200);
    }
}
