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
// ================================
// GET LISTINGS BY LOCATION (MAP)
// ================================
exports.getListingsByLocation = async (req, res, next) => {
    try {
      const { 
        lat, 
        lng, 
        radius = 10,
        limit = 50 
      } = req.query;
  
      if (!lat || !lng) {
        return res.status(400).json({
          success: false,
          message: 'Latitude and longitude are required'
        });
      }
  
      const latitude  = parseFloat(lat);
      const longitude = parseFloat(lng);
      const radiusKm  = parseFloat(radius);
  
      const query = `
        SELECT 
          p.*,
          s.name  as seller_name,
          s.phone as seller_phone,
          (
            6371 * acos(
              cos(radians(?)) * cos(radians(latitude)) * 
              cos(radians(longitude) - radians(?)) + 
              sin(radians(?)) * sin(radians(latitude))
            )
          ) AS distance
        FROM properties p
        LEFT JOIN sellers s ON p.seller_id = s.id
        WHERE p.latitude IS NOT NULL 
          AND p.longitude IS NOT NULL
        HAVING distance <= ?
        ORDER BY distance ASC
        LIMIT ?
      `;
  
      const [properties] = await db.query(query, [
        latitude, longitude, latitude, radiusKm, parseInt(limit)
      ]);
  
      res.json({
        success: true,
        data: properties,
        center: { lat: latitude, lng: longitude },
        radius: radiusKm,
        count: properties.length
      });
  
    } catch (error) {
      next(error);
    }
  };
  
  // ================================
  // GET ALL PROPERTIES FOR MAP
  // ================================
  exports.getPropertiesForMap = async (req, res, next) => {
    try {
      const { bounds, status } = req.query;
  
      let whereClause = 'WHERE latitude IS NOT NULL AND longitude IS NOT NULL';
      const params = [];
  
      if (bounds) {
        const { north, south, east, west } = JSON.parse(bounds);
        whereClause += ' AND latitude BETWEEN ? AND ? AND longitude BETWEEN ? AND ?';
        params.push(south, north, west, east);
      }
  
      if (status) {
        whereClause += ' AND status = ?';
        params.push(status);
      }
  
      const query = `
        SELECT 
          id, title, price, latitude, longitude,
          address, property_type, bedrooms, bathrooms,
          area, images, status
        FROM properties
        ${whereClause}
        LIMIT 500
      `;
  
      const [properties] = await db.query(query, params);
  
      const markers = properties.map(p => ({
        id: p.id,
        position: {
          lat: parseFloat(p.latitude),
          lng: parseFloat(p.longitude)
        },
        title:        p.title,
        price:        p.price,
        address:      p.address,
        propertyType: p.property_type,
        bedrooms:     p.bedrooms,
        bathrooms:    p.bathrooms,
        area:         p.area,
        image:        p.images ? JSON.parse(p.images)[0] : null,
        status:       p.status
      }));
  
      res.json({
        success: true,
        data: markers,
        count: markers.length
      });
  
    } catch (error) {
      next(error);
    }
  };