const express = require('express');
const AdminlayoutController = require('../controllers/admin_layout');

const router = express.Router();

router.get('/', AdminlayoutController.getLanding);
router.get('/backup', AdminlayoutController.getBackUp);
router.get('/restore', AdminlayoutController.restoreBackUp);
router.get('/operators', AdminlayoutController.getAdminOperator);
router.get('/schools', AdminlayoutController.getSchools);
router.get('/schools-add', AdminlayoutController.getAddSchool);
router.get('/borrow', AdminlayoutController.getBorrowSchool);
router.get('/borrow', AdminlayoutController.getBorrowYoung);
router.get('/authors', AdminlayoutController.getAuthor5Books);

module.exports = router;