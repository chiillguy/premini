<?php

namespace App\Http\Controllers;

use App\Http\Requests\CookingEventRequest;
use App\Models\Cooking_event;
use Illuminate\Http\Request;

class CookingEventController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $cooking_event = Cooking_event::with('chef');

        return response()->json($cooking_event);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CookingEventRequest $request)
    {
        $cooking_event = Cooking_event::create($request->validated());

        return response()->json([
            'message' => 'Cooking event created',
            'cooking_event' => $cooking_event->load('chef')
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(CookingEventRequest $request, Cooking_event $cooking_event)
    {
        $cooking_event->update($request->validated());

        return response()->json([
            'message' => 'Cooking event updated',
            'cooking_event' => $cooking_event->load('chef')
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
