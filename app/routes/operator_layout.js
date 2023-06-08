const express = require('express');
const OperatorlayoutController = require('../controllers/operator_layout');

const router = express.Router();

router.get('/', OperatorlayoutController.getLanding);
router.get('/users', OperatorlayoutController.getOperatorUser);
router.get('/books', OperatorlayoutController.getOperatorBook);
router.get('/books-add', OperatorlayoutController.getAddBook);
router.get('/borrows', OperatorlayoutController.getOperatorBorrow);
router.get('/reviews', OperatorlayoutController.getOperatorQuery3);
router.get('/reservations', OperatorlayoutController.getOperatorReservation);
router.get('/borrow-add', OperatorlayoutController.getAddBorrow);


// router.get('/borrow-upd', OperatorlayoutController.updReturnDate);

module.exports = router;