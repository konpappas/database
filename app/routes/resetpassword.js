const express = require('express');
const resetpwdController = require('../controllers/resetpassword');

const router = express.Router();

router.get('/', resetpwdController.getReset);
router.post('/', resetpwdController.postReset);
//router.post('/', resetpwdController.postupdateReset);

module.exports = router;