const express = require('express');
const UserlayoutController = require('../controllers/user_layout');
const router = express.Router();

router.get('/', UserlayoutController.getLanding);
router.get('/books', UserlayoutController.getUserBooks);
router.get('/books', UserlayoutController.getMyBooks);
router.get('/users', UserlayoutController.getMyinfo);
router.get('/reservations', UserlayoutController.getMyReservations);
// router.get('/reservation-add', UserlayoutController.addReservation);
// Book routes
//router.get('/books/:id', ProfessorlayoutController.displayBookDetails);
//router.post('/books/:id/review', ProfessorlayoutController.submitReview);

// Review routes
//router.post('/reviews/:id/approve', ProfessorlayoutController.approveReview);
//router.get('/reviews/pending', ProfessorlayoutController.viewPendingReviews);

// Reservation routes
//router.post('/reservations/:id/cancel', ProfessorlayoutController.cancelReservation);

// User routes
//outer.get('/borrowed-books', ProfessorlayoutController.viewBorrowedBooks);
//router.get('/profile', ProfessorlayoutController.displayUserProfile);
//router.post('/profile', ProfessorlayoutController.updateUserProfile);

module.exports = router;
