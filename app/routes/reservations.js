const express = require('express');
const borrowController = require('../controllers/reservations');

const router = express.Router();

router.get('/', borrowController.getReservations);

module.exports = router;