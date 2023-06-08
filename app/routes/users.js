const express = require('express');
const usersController = require('../controllers/users');

const router = express.Router();

router.get('/', usersController.getUsers);
router.post('/delete/:user_id', usersController.postdeleteUsers);
router.post('/approve/:user_id', usersController.postApproveUsers);

router.get('/myinfo', usersController.getMyinfo);
router.post('/modifymyinfo/:user_id', usersController.postProfChangeInfo);
module.exports = router;