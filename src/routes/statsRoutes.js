const express = require('express');
const router = express.Router();
const statsController = require('../controllers/statsController');
const { verifyToken, isAdmin } = require('../middleware/auth');

// Admin only route
router.get('/dashboard', verifyToken, isAdmin, statsController.getDashboardStats);

module.exports = router;