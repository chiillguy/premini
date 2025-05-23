<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            'cors' => \App\Http\Middleware\CorsMiddleware::class,
            'role' => \App\Http\Middleware\RoleMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();

    // $app->router->middlewareGroup('api', [
    //     \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
    //     \Illuminate\Routing\Middleware\SubstituteBindings::class,
    // ]);

    $app->middleware([
        \App\Http\Middleware\SessionTimeout::class,
    ]);

    $app->middleware([
        \App\Http\Middleware\SessionTimeout::class,
    ]);

