<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */

    // public function handle(Request $request, Closure $next, ...$roles): Response
    // {
    //     if (!in_array($request->user()->role, $roles)) {
    //         return response()->json(['message' => 'Unauthorized.'], 403);
    //     }
    //     return $next($request);
    // }

    public function handle($request, Closure $next, ...$roles)
    {
        
        if (!Auth::check()) {
            return response()->json(['message' => 'Unauthenticated'], 401);
        }
    
        $user = Auth::user();
        if (!$user) {
            return response()->json(['message' => 'User not found'], 403);
        }
    
        if (!in_array($user->role, $roles)) {
            return response()->json(['message' => 'Forbidden: You do not have permission'], 403);
        }
    
        return $next($request);
    }
}
