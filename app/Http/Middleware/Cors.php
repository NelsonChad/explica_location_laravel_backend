<?php

namespace App\Http\Middleware;

use Closure;

class Cors
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

       // header("Access-Control-Allow-Origin: http://localhost:8100");
       header("Access-Control-Allow-Origin: *");

        // ALLOW OPTIONS METHOD
        $headers = [
            'Access-Control-Allow-Methods' => 'POST, GET, OPTIONS, PUT, DELETE, HEAD, PATCH',
            'Access-Control-Allow-Headers' => 'Content-Type, X-Auth-Token, Origin, Authorization, X-Requested-With, X-XSRF-TOKEN, X-PINGOTHER, Accept',
            'Access-Control-Max-Age' => '86400',
        ];

        if ($request->method() === 'OPTIONS') {
        $headers = [
            'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods'=>'POST, GET, OPTIONS, PUT, DELETE'
        ];
        return (new Response(' ', 200))
            ->withHeaders($headers);
    }
    else {
        return $next($request);
    };

        $response = $next($request);
        foreach($headers as $key => $value)
            $response->header($key, $value);
        return $response;

       /*return $next($request)
            ->header('Access-Control-Allow-Origin', '*')
            ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE, OPTIONS')
            ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With, X-XSRF-TOKEN, X-PINGOTHER');*/
    }
}
