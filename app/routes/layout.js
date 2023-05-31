const express = require('express');
const layoutController = require('../controllers/layout');

const router = express.Router();

router.get('/', layoutController.getLanding);
router.get('/signup', layoutController.getCreateUser);
router.get('/login', layoutController.getLogin);

module.exports = router;