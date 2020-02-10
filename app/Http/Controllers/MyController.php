<?php

/**
 * 2.8 evening
 * https://www.tutorialspoint.com/laravel/laravel_controllers.htm
 * https://laravel.com/docs/6.x/controllers
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

/**
 * http://localhost:8000/my  (index)
 * http://localhost:8000/my/create (create)
 * http://localhost:8000/my/1   (show)
 * http://localhost:8000/my/1/edit (edit)
 */
class MyController extends Controller
{
    public function index()
    {
        echo 'index';
    }

    public function create()
    {
        echo 'create';
    }

    public function store(Request $request)
    {
        echo 'store';
    }

    public function show($id)
    {
        echo 'show';
    }

    public function edit($id)
    {
        echo 'edit';
    }

    public function update(Request $request, $id)
    {
        echo 'update';
    }

    public function destroy($id)
    {
        echo 'destroy';
    }
}
