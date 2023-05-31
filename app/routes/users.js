const express = require('express');
const usersController = require('../controllers/users');

const router = express.Router();

router.get('/', usersController.getUsers);
router.post('/delete/:user_id', usersController.postdeleteUsers);
router.post('/approve/:user_id', usersController.postApproveUsers);

module.exports = router;