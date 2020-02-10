<?php

/**
 * 2.8 evening
 * https://www.tutorialspoint.com/laravel/laravel_controllers.htm
 * https://laravel.com/docs/6.x/controllers
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ImplicitController extends Controller
{
    private $myclass;

    public function __construct(\MyClass $myclass)
    {
        $this->myclass = $myclass;
    }

    public function index()
    {
        dd($this->myclass);
    }

    public function index_MethodInjection(\MyClass $myclass)
    {
        dd($myclass);
    }

//    /**
//     * Responds to requests to GET /test
//     */
//    public function getIndex()
//    {
//        echo 'index method';
//    }
//
//    /**
//     * Responds to requests to GET /test/show/1
//     */
//    public function getShow($id)
//    {
//        echo 'show method';
//    }
//
//    /**
//     * Responds to requests to GET /test/admin-profile
//     */
//    public function getAdminProfile()
//    {
//        echo 'admin profile method';
//    }
//
//    /**
//     * Responds to requests to POST /test/profile
//     */
//    public function postProfile()
//    {
//        echo 'profile method';
//    }
}
