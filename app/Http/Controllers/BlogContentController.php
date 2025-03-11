<?php

namespace App\Http\Controllers;

use App\Http\Requests\BlogContentRequest;
use App\Http\Requests\UpdateBlogContentRequest;
use App\Http\Resources\BlogContentResource;
use App\Models\BlogContent;
use Illuminate\Http\Request;

class BlogContentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return BlogContentResource::collection(BlogContent::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(BlogContentRequest $request)
    {
        $blogContent = BlogContent::create($request->validated());

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('blog-contents', 'public');

            $blogContent->update(['image' => $imagePath]);
        }

        return response()->json([
            'message' => 'Blog content created',
            'content' => new BlogContentResource($blogContent)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(BlogContent $blogContent)
    {
        return new BlogContentResource($blogContent);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBlogContentRequest $request, BlogContent $blogContent)
    {
        $blogContent->update($request->validated());

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('blog-contents', 'public');
            $blogContent->update(['image' => $imagePath]);
        }

        return response()->json([
            'message' => 'Blog content updated',
            'cotent' => new BlogContentResource($blogContent)
        ], 202);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BlogContent $blogContent)
    {
        $blogContent->delete();

        return response()->json(['message' => 'Blog content deleted successfully'], 200);
    }
}
