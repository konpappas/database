const express = require('express');
const authorController = require('../controllers/authors');

const router = express.Router();

router.get('/query3.1.4', authorController.getAuthorsNoBook);
router.get('/query3.1.7', authorController.getAuthors5Books);

module.exports = router;