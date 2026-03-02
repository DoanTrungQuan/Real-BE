const { validationResult } = require('express-validator');
const Seller = require('../models/Seller');

// Get all sellers
exports.getAllSellers = async (req, res, next) => {
  try {
    const sellers = await Seller.getAll();
    res.json({
      success: true,
      count: sellers.length,
      data: sellers
    });
  } catch (error) {
    next(error);
  }
};

// Get seller by ID
exports.getSellerById = async (req, res, next) => {
  try {
    const seller = await Seller.findById(req.params.id);
    
    if (!seller) {
      return res.status(404).json({ 
        success: false, 
        message: 'Seller not found' 
      });
    }

    res.json({
      success: true,
      data: seller
    });
  } catch (error) {
    next(error);
  }
};

// Create seller
exports.createSeller = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ 
        success: false, 
        message: 'Validation failed', 
        errors: errors.array() 
      });
    }

    const sellerId = await Seller.create(req.body);
    const seller = await Seller.findById(sellerId);

    res.status(201).json({
      success: true,
      message: 'Seller created successfully',
      data: seller
    });
  } catch (error) {
    next(error);
  }
};

// Update seller
exports.updateSeller = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ 
        success: false, 
        message: 'Validation failed', 
        errors: errors.array() 
      });
    }

    const updated = await Seller.update(req.params.id, req.body);
    
    if (!updated) {
      return res.status(404).json({ 
        success: false, 
        message: 'Seller not found' 
      });
    }

    const seller = await Seller.findById(req.params.id);

    res.json({
      success: true,
      message: 'Seller updated successfully',
      data: seller
    });
  } catch (error) {
    next(error);
  }
};

// Delete seller
exports.deleteSeller = async (req, res, next) => {
  try {
    const deleted = await Seller.delete(req.params.id);
    
    if (!deleted) {
      return res.status(404).json({ 
        success: false, 
        message: 'Seller not found' 
      });
    }

    res.json({
      success: true,
      message: 'Seller deleted successfully'
    });
  } catch (error) {
    next(error);
  }
};