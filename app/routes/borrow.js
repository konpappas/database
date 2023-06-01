const express = require('express');
const borrowController = require('../controllers/borrow');

const router = express.Router();

router.get('/', borrowController.getBorrowperSchool);

module.exports = router;