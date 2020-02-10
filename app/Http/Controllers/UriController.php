<?php

/**
 * 2.9 evening
 * https://www.tutorialspoint.com/laravel/laravel_request.htm
 * https://laravel.com/docs/6.x/requests
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UriController extends Controller
{
    public function index(Request $request)
    {
        // Usage of path method
        $path = $request->path();
        echo 'Path Method: ' . $path;
        echo '<br>';

        // Usage of is method
        $pattern = $request->is('foo/*');
        echo 'is Method: ' . $pattern;
        echo '<br>';

        // Usage of url method
        $url = $request->url();
        echo 'URL method: ' . $url;
    }
}
