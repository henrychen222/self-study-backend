<?php

/**
 * 2.8 evening
 * https://www.tutorialspoint.com/laravel/laravel_controllers.htm
 * https://laravel.com/docs/6.x/controllers
 */

namespace App\Http\Middleware;

use Closure;

class FirstMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        echo '<br>First Middleware';
        return $next($request);
    }
}
