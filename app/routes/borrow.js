const express = require('express');
const borrowController = require('../controllers/borrow');

const router = express.Router();

router.get('/', borrowController.getBorrowperSchool);
router.get('/query3.1.3', borrowController.getBorrowYoung);

module.exports = router;