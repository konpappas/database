const express = require('express');
const categoryController = require('../controllers/categories');

const router = express.Router();

router.get('/query3.1.2', categoryController.getCategChoice);

module.exports = router;