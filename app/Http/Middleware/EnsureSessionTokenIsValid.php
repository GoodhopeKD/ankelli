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
        if (( !env('MIX_API_URL') && $request->path() == "api/accounts" ) || ( env('MIX_API_URL') && $request->path() == "accounts") || str_contains( $request->path(), 'webhooks' ) ) return $next($request);
        
        $session_token = $request->header('x-session-token');
        if (!$session_token) return abort(401,'Session token header required');

        $session = _Session::find( $session_token );
        if (!$session) return abort(401,'Invalid session token provided');
        if ($session['_status'] == "ended") abort(401,'Session with provided token is marked as ended');

        session()->put('active_session_token', $session_token);

        return $next($request);
    }
}
