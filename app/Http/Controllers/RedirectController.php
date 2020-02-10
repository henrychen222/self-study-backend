<?php

/**
 * 2.9 evening
 * https://www.tutorialspoint.com/laravel/laravel_redirections.htm
 * https://laravel.com/docs/6.x/redirects
 */
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RedirectController extends Controller
{
    public function index() {
        echo "Redirecting to controller's action.";
    }
}
