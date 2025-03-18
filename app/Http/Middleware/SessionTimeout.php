<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class SessionTimeout
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $timeout = 15 * 60; // 15 menit dalam detik
        if (time() - session('lastActivityTime', time()) > $timeout) {
            Auth::logout();
            session()->flush();
            return redirect('/login')->with('message', 'Session expired. Please login again.');
        }
        session(['lastActivityTime' => time()]);

        return $next($request);
    }
}
