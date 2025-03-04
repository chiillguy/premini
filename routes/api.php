<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CookingEventController;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\RecipeIngredientController;
use App\Http\Controllers\RecipeReviewController;
use App\Http\Controllers\RecipeStepController;
use App\Http\Middleware\RoleMiddleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('register', [AuthController::class, 'register'])->name('register');
Route::post('login', [AuthController::class, 'login'])->name('login');

Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout'])->name('logout');
    Route::get('me', [AuthController::class, 'me'])->name('me');
    Route::apiResource('recipe-reviews', RecipeReviewController::class);

    Route::middleware(RoleMiddleware::class . ':admin')->group(function () {
        Route::apiResource('categories', CategoryController::class);
    });
    
    Route::middleware(RoleMiddleware::class . ':admin,chef')->group(function () {
        Route::apiResource('recipes', RecipeController::class);
        Route::apiResource('cooking-event', CookingEventController::class);
    });
    
    Route::middleware(RoleMiddleware::class . ':chef')->group(function () {
        Route::apiResource('recipe-steps', RecipeStepController::class);
        Route::apiResource('recipe-ingredients', RecipeIngredientController::class);
    });

    Route::middleware(RoleMiddleware::class . ':admin,chef,user')->group(function () {
        Route::get('/recipes', [RecipeController::class, 'index'])->name('recipes');

    });
});
