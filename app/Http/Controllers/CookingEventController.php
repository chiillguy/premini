<?php

namespace App\Http\Controllers;

use App\Http\Requests\CookingEventRequest;
use App\Http\Requests\UpdateCookingEventRequest;
use App\Http\Resources\CookingEventResource;
use App\Models\Cooking_event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CookingEventController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return CookingEventResource::collection(Cooking_event::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CookingEventRequest $request)
    {
        $cooking_event = Cooking_event::create([
            'chef_id' => Auth::id(),
            'title' => $request->title,
            'description' => $request->description,
            'date' => $request->date,
            'location' => $request->location,
            'image' => $request->image,
        ]);

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('cooking-events', 'public');

            $cooking_event->update(['image' => 'storage/' . $imagePath]);
        }

        return response()->json([
            'message' => 'Cooking event created',
            'cooking_event' => new CookingEventResource($cooking_event)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Cooking_event $cooking_event)  
    {
        return new CookingEventResource($cooking_event);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCookingEventRequest $request, Cooking_event $cooking_event)
    {
        $cooking_event->update($request->validated());

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('cooking-events', 'public');
            $cooking_event->update(['image' => 'storage/' . $imagePath]);
        }

        return response()->json([
            'message' => 'Cooking event updated',
            'cooking_event' => new CookingEventResource($cooking_event)
        ], 202);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cooking_event $cooking_event)
    {
        $cooking_event->delete();

        return response()->json(['message' => 'Cooking event deleted successfully'], 200);
    }
}
