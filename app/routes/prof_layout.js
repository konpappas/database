// router.js

const express = require('express');
const ProfessorlayoutController = require('../controllers/prof_layout');
const router = express.Router();

router.get('/', ProfessorlayoutController.getLanding);
// Book routes
router.get('/books/:id', ProfessorlayoutController.displayBookDetails);
router.post('/books/:id/review', ProfessorlayoutController.submitReview);

// Review routes
router.post('/reviews/:id/approve', ProfessorlayoutController.approveReview);
router.get('/reviews/pending', ProfessorlayoutController.viewPendingReviews);

// Reservation routes
router.post('/reservations/:id/cancel', ProfessorlayoutController.cancelReservation);

// User routes
router.get('/borrowed-books', ProfessorlayoutController.viewBorrowedBooks);
router.get('/profile', ProfessorlayoutController.displayUserProfile);
router.post('/profile', ProfessorlayoutController.updateUserProfile);

module.exports = router;
