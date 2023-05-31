const express = require('express');
const operController = require('../controllers/operators');

const router = express.Router();

router.get('/', operController.getOperators);
router.post('/approveOp/:user_id', operController.postApproveOperators);


module.exports = router;