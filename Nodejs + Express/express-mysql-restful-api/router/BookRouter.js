var Book = require('../model/BookModel.js');
var express = require('express');
var router = express.Router();

router.route('/books')
// create a book (accessed at POST http://localhost:8080/api/books)
.post(function(req, res) {

	var bookname = req.body.bookname; //bodyParser does the magic
	var author = req.body.author;
	
	var book = Book.build({ bookname: bookname, author: author });
	book.add(function(success){
		res.json({ message: 'Book created!' });
	},
	function(err) {
		res.send(err);
	});
})
// get all the books (accessed at GET http://localhost:8080/api/books)
.get(function(req, res) {
	var book = Book.build();
	
	book.retrieveAll(function(books) {
		if (books) {				
		  res.json(books);
		} else {
		  res.send(401, "Book not found");
		}
	  }, function(error) {
		res.send("Book not found");
	  });
});

// on routes that end in /books/:book_id
// ----------------------------------------------------
router.route('/books/:book_id')
// update a book (accessed at PUT http://localhost:8080/api/books/:book_id)
.put(function(req, res) {
	var book = Book.build();	
	  
	book.bookname = req.body.bookname;
	book.author = req.body.author;
	
	book.updateById(req.params.book_id, function(success) {
		console.log(success);
		if (success) {	
			res.json({ message: 'Book updated!' });
		} else {
		  res.send(401, "Book not found");
		}
	  }, function(error) {
		res.send("Book not found");
	  });
})
// get a book by id(accessed at GET http://localhost:8080/api/books/:book_id)
.get(function(req, res) {
	var book = Book.build();
	
	book.retrieveById(req.params.book_id, function(books) {
		if (books) {				
		  res.json(books);
		} else {
		  res.send(401, "Book not found");
		}
	  }, function(error) {
		res.send("Book not found");
	  });
})
// delete a book by id (accessed at DELETE http://localhost:8080/api/books/:book_id)
.delete(function(req, res) {
	var book = Book.build();
	
	book.removeById(req.params.book_id, function(books) {
		if (books) {				
		  res.json({ message: 'Book removed!' });
		} else {
		  res.send(401, "Book not found");
		}
	  }, function(error) {
		res.send("Book not found");
	  });
});

module.exports = router;