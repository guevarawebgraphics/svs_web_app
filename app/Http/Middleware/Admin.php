<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Response;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if ($request->user() == null)
        {
            abort(404);
        }
        else
        {
            if ($request->user()->is_admin != 1 && $request->user()->is_admin != 2)

            {
                abort(403);
            }
            return $next($request);
        }
    }
}
