const express = require('express');
const borrowController = require('../controllers/borrow');

const router = express.Router();

router.get('/', borrowController.getBorrowperSchool);
router.get('/query3.1.3', borrowController.getBorrowYoung);
router.get('/query3.1.5', borrowController.getsameBorrow);

module.exports = router;