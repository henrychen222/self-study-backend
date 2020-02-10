{{--2.9 evening--}}
{{--https://www.tutorialspoint.com/laravel/laravel_blade_templates.htm--}}
{{--https://laravel.com/docs/6.x/blade--}}

@extends('layouts.app')
@section('title', 'Page Title')
@section('sidebar')
    @parent
    <p>This refers to the master sidebar.</p>
@endsection
@section('content')
    <p>This is my body content.</p>
@endsection
