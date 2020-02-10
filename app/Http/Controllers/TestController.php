<?php

/**
 * 2.7 night
 * https://www.tutorialspoint.com/laravel/laravel_middleware.htm
 * https://laravel.com/docs/6.x/middleware
 */
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
    public function index()
    {
        echo "<br>Test Controller.";
    }
}
