const { validationResult } = require('express-validator');
const Property = require('../models/Property');

// Get all properties
exports.getAllProperties = async (req, res, next) => {
  try {
    const properties = await Property.getAll();
    res.json({
      success: true,
      count: properties.length,
      data: properties
    });
  } catch (error) {
    next(error);
  }
};

// Get property by ID
exports.getPropertyById = async (req, res, next) => {
  try {
    const property = await Property.findById(req.params.id);
    
    if (!property) {
      return res.status(404).json({ 
        success: false, 
        message: 'Property not found' 
      });
    }

    res.json({
      success: true,
      data: property
    });
  } catch (error) {
    next(error);
  }
};

// Search properties
exports.searchProperties = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ 
        success: false, 
        message: 'Validation failed', 
        errors: errors.array() 
      });
    }

    const filters = {
      keyword: req.query.keyword,
      type: req.query.type,
      status: req.query.status,
      minPrice: req.query.minPrice,
      maxPrice: req.query.maxPrice
    };

    const properties = await Property.search(filters);

    res.json({
      success: true,
      count: properties.length,
      data: properties
    });
  } catch (error) {
    next(error);
  }
};

// Create property
exports.createProperty = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ 
        success: false, 
        message: 'Validation failed', 
        errors: errors.array() 
      });
    }

    const propertyId = await Property.create(req.body);
    const property = await Property.findById(propertyId);

    res.status(201).json({
      success: true,
      message: 'Property created successfully',
      data: property
    });
  } catch (error) {
    next(error);
  }
};

// Update property
exports.updateProperty = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ 
        success: false, 
        message: 'Validation failed', 
        errors: errors.array() 
      });
    }

    const updated = await Property.update(req.params.id, req.body);
    
    if (!updated) {
      return res.status(404).json({ 
        success: false, 
        message: 'Property not found' 
      });
    }

    const property = await Property.findById(req.params.id);

    res.json({
      success: true,
      message: 'Property updated successfully',
      data: property
    });
  } catch (error) {
    next(error);
  }
};

// Delete property
exports.deleteProperty = async (req, res, next) => {
  try {
    const deleted = await Property.delete(req.params.id);
    
    if (!deleted) {
      return res.status(404).json({ 
        success: false, 
        message: 'Property not found' 
      });
    }

    res.json({
      success: true,
      message: 'Property deleted successfully'
    });
  } catch (error) {
    next(error);
  }
};