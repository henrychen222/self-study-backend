<?php

/**
 * 2.9 evening
 * https://www.tutorialspoint.com/laravel/laravel_cookie.htm
 * https://laravel.com/docs/6.x/requests#cookies
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

class CookieController extends Controller
{
    public function setCookie(Request $request)
    {
        $minutes = 1;
        $response = new Response('Hello World');
        $response->withCookie(cookie('name', 'virat', $minutes));
        return $response;
    }

    public function getCookie(Request $request)
    {
        $value = $request->cookie('name');
        echo $value;
    }
}
