<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\_Session;

class EnsureSessionTokenIsValid
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (( !env('API_URL') && $request->path() == "api" ) || ( env('API_URL') && $request->path() == "/")) return $next($request);
        $session = _Session::findOrFail( $request->segments()[env('API_URL')?0:1] );
        if ( $session && $session['_status'] !== "ended" ){
            $request->route()->forgetParameter('session_token');
            return $next($request);
        } else {
            return abort(403);
        }
    }
}
