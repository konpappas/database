const express = require('express');
const OperatorlayoutController = require('../controllers/operator_layout');

const router = express.Router();

router.get('/', OperatorlayoutController.getLanding);
router.get('/users', OperatorlayoutController.getOperatorUser);

module.exports = router;