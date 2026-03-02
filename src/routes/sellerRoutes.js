const express = require('express');
const router = express.Router();
const sellerController = require('../controllers/sellerController');
const { verifyToken, isAdmin } = require('../middleware/auth');
const { sellerValidation } = require('../utils/validation');

// All routes require authentication and admin privileges
router.use(verifyToken, isAdmin);

router.get('/', sellerController.getAllSellers);
router.get('/:id', sellerController.getSellerById);
router.post('/', sellerValidation.create, sellerController.createSeller);
router.put('/:id', sellerValidation.update, sellerController.updateSeller);
router.delete('/:id', sellerController.deleteSeller);

module.exports = router;