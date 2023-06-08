const express = require('express');
const UserlayoutController = require('../controllers/user_layout');
const router = express.Router();

router.get('/', UserlayoutController.getLanding);
router.get('/books', UserlayoutController.getUserBooks);
router.get('/books', UserlayoutController.getMyBooks);
router.get('/users', UserlayoutController.getMyinfo);
<<<<<<< HEAD
router.get('/reviews', UserlayoutController.getReviews);
=======
router.get('/reservations', UserlayoutController.getMyReservations);
// router.get('/reservation-add', UserlayoutController.addReservation);
>>>>>>> dba67b5a14786f3d40a11e11355ffcb49341c2ca
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
