const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const { verifyToken } = require('../middleware/auth');
const { authValidation } = require('../utils/validation');

// Public routes
router.post('/register', authValidation.register, authController.register);
router.post('/login', authValidation.login, authController.login);

// Protected routes
router.get('/me', verifyToken, authController.getCurrentUser);

module.exports = router;