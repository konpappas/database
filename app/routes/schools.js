const express = require('express');
const schoolsController = require('../controllers/schools');

const router = express.Router();

router.get('/', schoolsController.getSchools);
router.post('/add', schoolsController.postSchool);

module.exports = router;