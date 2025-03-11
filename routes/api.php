<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlogContentController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CookingEventController;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\RecipeIngredientController;
use App\Http\Controllers\RecipeReviewController;
use App\Http\Controllers\RecipeStepController;
use App\Http\Middleware\RoleMiddleware;
use Illuminate\Support\Facades\Route;

Route::post('register', [AuthController::class, 'register'])->name('register');
Route::post('login', [AuthController::class, 'login'])->name('login');

Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout'])->name('logout');
    Route::get('me', [AuthController::class, 'me'])->name('me');

    // **User, Chef, Admin bisa melihat resep & memberikan review**
    Route::apiResource('recipes', RecipeController::class)->only(['index', 'show']);
    Route::apiResource('recipe-reviews', RecipeReviewController::class)->only(['index', 'store', 'show']);
    Route::apiResource('cooking-events', CookingEventController::class)->only(['index', 'show']);

    // **Admin**
    Route::middleware(RoleMiddleware::class . ':admin')->group(function () {
        Route::apiResource('categories', CategoryController::class);
        Route::apiResource('recipe-reviews', RecipeReviewController::class)->only('delete');
        Route::apiResource('blogs', BlogController::class);
        Route::apiResource('blog-contents', BlogContentController::class);
    });

    // **Chef & Admin**
    Route::middleware(RoleMiddleware::class . ':admin,chef')->group(function () {
        Route::apiResource('cooking-events', CookingEventController::class)->except(['index', 'show']);
    });
    
    // **Chef**
    Route::middleware(RoleMiddleware::class . ':chef')->group(function () {
        Route::apiResource('recipes', RecipeController::class)->except(['index', 'show']);
        Route::apiResource('recipe-steps', RecipeStepController::class);
        Route::apiResource('recipe-ingredients', RecipeIngredientController::class);
    });
});
