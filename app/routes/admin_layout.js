const express = require('express');
const AdminlayoutController = require('../controllers/admin_layout');

const router = express.Router();

router.get('/', AdminlayoutController.getLanding);
router.get('/backup', AdminlayoutController.getBackUp);
router.get('/restore', AdminlayoutController.restoreBackUp);
router.get('/operators', AdminlayoutController.getAdminOperator);
router.get('/schools', AdminlayoutController.getSchools);
router.get('/schools-add', AdminlayoutController.getAddSchool);
router.get('/borrows', AdminlayoutController.getBorrowSchool);
router.get('/borrows', AdminlayoutController.getBorrowYoung);
router.get('/borrows', AdminlayoutController.getsameBorrow);
router.get('/authors', AdminlayoutController.getAuthor5Books);
router.get('/authors', AdminlayoutController.getAuthor5Books);
router.get('/authors', AdminlayoutController.getAuthorsNoBorrow);
router.get('/categories', AdminlayoutController.getCategChoice);
router.get('/categories', AdminlayoutController.getTop3Cat);

module.exports = router;