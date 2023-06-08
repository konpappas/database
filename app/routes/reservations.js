const express = require('express');
const reservationController = require('../controllers/reservations');

const router = express.Router();

router.get('/', reservationController.getReservations);
router.post('/toBorrow', reservationController.addBorrow);
router.get('/users', reservationController.getUserReservations);
router.post('/users/delete', reservationController.postdeleteReservation);
module.exports = router;