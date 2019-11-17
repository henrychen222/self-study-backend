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