const express = require('express');
const reviewController = require('../controllers/reviews');

const router = express.Router();

router.get('/', reviewController.getoperquery3);

module.exports = router;