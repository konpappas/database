const express = require('express');
const booksController = require('../controllers/books');

const router = express.Router();

router.get('/', booksController.getBooks);
router.post('/add', booksController.postBook);

module.exports = router;