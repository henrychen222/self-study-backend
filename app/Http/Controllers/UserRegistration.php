<?php

/**
 * 2.9 evening
 * https://www.tutorialspoint.com/laravel/laravel_request.htm
 * https://laravel.com/docs/6.x/requests
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserRegistration extends Controller
{
    public function postRegister(Request $request)
    {
        //Retrieve the name input field
        $name = $request->input('name');
        echo 'Name: ' . $name;
        echo '<br>';

        //Retrieve the username input field
        $username = $request->username;
        echo 'Username: ' . $username;
        echo '<br>';

        //Retrieve the password input field
        $password = $request->password;
        echo 'Password: ' . $password;
    }
}
