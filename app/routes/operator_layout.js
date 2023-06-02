const express = require('express');
const OperatorlayoutController = require('../controllers/operator_layout');

const router = express.Router();

router.get('/', OperatorlayoutController.getLanding);
router.get('/users', OperatorlayoutController.getOperatorUser);
router.get('/books', OperatorlayoutController.getOperatorBook);
router.get('/books-add', OperatorlayoutController.getAddBook);

module.exports = router;