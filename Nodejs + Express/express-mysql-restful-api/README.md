#Express-MySQL-RESTful API
基于Express实现的RESTful API

##一.项目来源
参考西班牙Web工程师Pablo Anaya的项目源码进行改进的demo。

原文链接地址：[http://www.pabloanaya.com/blog/building-api-node-js-express-4-mysql/#comments](http://www.pabloanaya.com/blog/building-api-node-js-express-4-mysql/#comments)

Pablo Anaya的Github地址：[https://github.com/pjanaya](https://github.com/pjanaya)

在Windows的CMD窗口下，进入项目根目录直接键入node server.js即可运行。

在浏览器中输入http://localhost:8080/api/users(或http://127.0.0.1:8080/api/users)即可访问users接口，其他接口访问方式类似。

##二.项目目录
	+conf
		--database.json // 数据库配置文件
	+model // model目录
		--Connection.js // 返回数据库连接句柄
	+router // router目录，相当于控制器
	+node_modules // node模块
	+sql // sql文件
	+postman // postman接口文件

##三.数据库配置
在数据配置文件中conf/database.json中添加相关信息。

	{
	  "dev": {
	    "driver": "mysql",
	    "user": "root",
	    "database": "tutorial",
	    "password": ""
	  },
	  "production": {
	    "driver": "mysql",
	    "user": "root",
	    "database": "myapp"
	  }
	}

为了区别开发环境和生产环境，可以根据需求添加相应的配置信息。

##四.连接数据库
在model中添加Connection.js文件，在里面进行连接数据库操作，并统一返回句柄给其他model使用。

	var Sequelize = require('sequelize');
	
	// db config
	var env = "dev";
	var config = require('../conf/database.json')[env];
	var password = config.password ? config.password : null;
	
	// initialize database connection
	var sequelize = new Sequelize(
		config.database,
		config.user,
		config.password,
		{
			logging: console.log,
			define: {
				timestamps: false
			}
		}
	);
	
	module.exports = sequelize;

这里连接开发环境的数据库，其他model模块直接通过require('./Connection')即可获得句柄。

##五.创建model

根据mvc的定义，一个model一般实现一个数据表的CRUD及其相应的拓展操作。demo中给出user表和book表，因此可以创建UserModel.js和BookModel.js两个model。

以BookModel.js为例：

	var DataTypes = require("sequelize");
	var sequelize = require('./Connection');
	
	var Book = sequelize.define('books', {
	    bookname: DataTypes.STRING,
	    author: DataTypes.STRING
	  }, {
	    instanceMethods: {
	      retrieveAll: function(onSuccess, onError) {
			Book.findAll({}, {raw: true})
				.success(onSuccess).error(onError);	
		  },
	      retrieveById: function(book_id, onSuccess, onError) {
			Book.find({where: {id: book_id}}, {raw: true})
				.success(onSuccess).error(onError);	
		  },
	      add: function(onSuccess, onError) {
			var bookname = this.bookname;
			var author = this.author;
			
			Book.build({ bookname: bookname, author: author })
				.save().success(onSuccess).error(onError);
		   },
		  updateById: function(book_id, onSuccess, onError) {
			var bookname = this.bookname;
			var author = this.author;
	
			Book.update({ bookname: bookname,author: author}, {id: book_id})
				.success(onSuccess).error(onError);
		   },
	      removeById: function(book_id, onSuccess, onError) {
			Book.destroy({id: book_id}).success(onSuccess).error(onError);	
		  }
	    }
	  });
	
	module.exports = Book;

sequelize对数据库的基本操作可以参照链接地址：[Sequelize 和 MySQL 对照](https://segmentfault.com/a/1190000003987871)。

##六.创建router

为了对URL进行路由，需要创建相应的router，在router下定义相应HTTP的method操作。如BookRouter.js下的router.route('/books').post()代表在浏览器中键入http://127.0.0.1:8080/api/books的post操作，router.route('/books').get()代表在浏览器中键入http://127.0.0.1:8080/api/books的get操作

##七.实现http://host/api/的URL格式

此外为了实现RESTful的规则，还需要规定host后加上api/，在server.js中可以通过app.use('/api', router)来实现。

##八.接口测试工具：postman

在进行接口开发时一般会把相应的接口保存在Collection中，以便随时调用，在文件夹postman中已经为大家配置好，导入即可使用。