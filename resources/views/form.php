<!--2.9 evening not working -->
<!--https://www.tutorialspoint.com/laravel/laravel_forms.htm-->
<!--https://laravel.com/docs/4.2/html-->

<html>
<body>

<?php
echo Form::open(array('url' => 'foo/bar'));
echo Form::text('username', 'Username');
echo '<br/>';

echo Form::text('email', 'example@gmail.com');
echo '<br/>';

echo Form::password('password');
echo '<br/>';

echo Form::checkbox('name', 'value');
echo '<br/>';

echo Form::radio('name', 'value');
echo '<br/>';

echo Form::file('image');
echo '<br/>';

echo Form::select('size', array('L' => 'Large', 'S' => 'Small'));
echo '<br/>';

echo Form::submit('Click Me!');
echo Form::close();
?>

</body>
</html>
