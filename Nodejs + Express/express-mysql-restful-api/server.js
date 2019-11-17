var express = require('express');
var app = express();
var	bodyParser = require('body-parser');
app.use(bodyParser());
var fs = require('fs');

// 定义特定环境下的端口
var env = app.get('env') == 'development' ? 'dev' : app.get('env');
var port = process.env.PORT || 8080;

// 加载路由
var files = fs.readdirSync('./router');
files.forEach((val,index) => {
    var router = require('./router/' + val);
    app.use('/api', router);
});

// 监听端口
app.listen(port);
console.log('Magic happens on port ' + port);