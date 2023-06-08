const express = require('express');
const reviewController = require('../controllers/reviews');

const router = express.Router();

router.get('/', reviewController.getoperquery3);
router.get('/published', reviewController.getReviews);
router.get('/allreviews', reviewController.getAllReviews);
router.post('/allreviews/approve/:review_id', reviewController.postApproveReview);

module.exports = router;