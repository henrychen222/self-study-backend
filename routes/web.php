<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

/************************************ Add **************************************/
// https://www.tutorialspoint.com/laravel/laravel_middleware.htm
Route::get('role', [
    'middleware' => 'Role:editor',  // middleware
    'uses' => 'TestController@index', // controller
]);

Route::get('terminate', [
    'middleware' => 'terminate',
    'uses' => 'ABCController@index',
]);


// https://www.tutorialspoint.com/laravel/laravel_controllers.htm
Route::get('/usercontroller/path', [
    'middleware' => 'First',
    'uses' => 'UserController@showPath'
]);

Route::resource('my', 'MyController'); // registering all the methods of MyController

//Route::controller('test','ImplicitController');

class MyClass
{
    public $foo = 'bar';
}

Route::get('/myclass', 'ImplicitController@index');
Route::get('/myclass2', 'ImplicitController@index_MethodInjection');


// https://www.tutorialspoint.com/laravel/laravel_request.htm
Route::get('/foo/bar', 'UriController@index');
Route::get('/register', function () {
    return view('register');
});
Route::post('/user/register', array('uses' => 'UserRegistration@postRegister'));

// https://www.tutorialspoint.com/laravel/laravel_cookie.htm
Route::get('/cookie/set', 'CookieController@setCookie');
Route::get('/cookie/get', 'CookieController@getCookie');


// https://www.tutorialspoint.com/laravel/laravel_response.htm
// https://laravel.com/docs/6.x/responses
Route::get('/basic_response', function () {
    return 'Hello World';
});

Route::get('/header', function () {
    return response("Hello", 200)->header('Content-Type', 'text/html');
});

Route::get('json', function () {
    return response()->json(['name' => 'Virat Gandhi', 'state' => 'Gujarat']);
});

// https://www.tutorialspoint.com/laravel/laravel_views.htm
// https://laravel.com/docs/6.x/views
Route::get('/test', function () {
    return view('test');
});

Route::get('/test_name', function () {
    return view('test_name', [‘name’ => ’ViratGandhi’]);  // not work
});

Route::get('/test2', function () {
    return view('test2');
});

// https://www.tutorialspoint.com/laravel/laravel_redirections.htm
Route::get('/test_start', ['as' => 'testing', function () {
    return view('testing');
}]);

Route::get('redirect', function () {
    return redirect()->route('testing');  // same as test_start view
});

Route::get('rr', 'RedirectController@index');
Route::get('/redirectcontroller', function () {
    return redirect()->action('RedirectController@index');
});

// https://www.tutorialspoint.com/laravel/laravel_forms.htm
Route::get('/form',function() {
    return view('form');
});
