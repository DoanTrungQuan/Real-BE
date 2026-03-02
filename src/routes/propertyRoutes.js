const express = require('express');
const router = express.Router();
const propertyController = require('../controllers/propertyController');
const { verifyToken, isAdmin } = require('../middleware/auth');
const { propertyValidation } = require('../utils/validation');

// Public routes (authenticated users)
router.get('/', verifyToken, propertyController.getAllProperties);
router.get('/search', verifyToken, propertyValidation.search, propertyController.searchProperties);
router.get('/:id', verifyToken, propertyController.getPropertyById);

// Admin only routes
router.post('/', verifyToken, isAdmin, propertyValidation.create, propertyController.createProperty);
router.put('/:id', verifyToken, isAdmin, propertyValidation.update, propertyController.updateProperty);
router.delete('/:id', verifyToken, isAdmin, propertyController.deleteProperty);

module.exports = router;