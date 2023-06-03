const express = require('express');
const categoryController = require('../controllers/categories');

const router = express.Router();

router.get('/query3.1.2', categoryController.getCategChoice);
router.get('/query3.1.6', categoryController.getTop3Cat);

module.exports = router;