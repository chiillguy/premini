<?php

namespace App\Http\Controllers;

use App\Http\Requests\RecipeReviewRequest;
use App\Http\Requests\UpdateRecipeReviewRequest;
use App\Http\Resources\RecipeResource;
use App\Http\Resources\RecipeReviewResource;
use App\Models\Recipe_review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RecipeReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reviews = Recipe_review::with('user')->get();
        return response()->json([
            'message' => 'Success Fetching Data',
            'data' => $reviews
        ], 200);
        // return RecipeReviewResource::collection(Recipe_review::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(RecipeReviewRequest $request)
    {
        $recipe_review = Recipe_review::create([
            'user_id' => Auth::id(),
            'recipe_id' => $request->recipe_id,
            'content' => $request->content,
            'image' => $request->image,
        ]);

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipe-reviews', 'public');

            $recipe_review->update(['image' => 'storage/' . $imagePath]);
        }

        return response()->json([
            'message' => 'Recipe review created',
            'recipe_review' => new RecipeReviewResource($recipe_review)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Recipe_review $recipe_review)
    {
        return new RecipeReviewResource($recipe_review);
    }

    // public function show(Recipe_review $recipe_review)
    // {
    //     $reviews = Recipe_review::where('recipe_id', $recipe_review->id);
    //     return response()->json(['reviews' => $reviews]);
    // }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRecipeReviewRequest $request, Recipe_review $recipe_review)
    {
        $recipe_review->update($request->validated());

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipe-reviews', 'public');
            $recipe_review->update(['image' => 'storage/' . $imagePath]);
        }

        return response()->json([
            'message' => 'Recipe review updated',
            'recipe_review' => new RecipeReviewResource($recipe_review)
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
