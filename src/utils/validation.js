const { body, query, param } = require('express-validator');

const authValidation = {
  register: [
    body('name').trim().notEmpty().withMessage('Name is required'),
    body('email').isEmail().withMessage('Valid email is required'),
    body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters')
  ],
  login: [
    body('email').isEmail().withMessage('Valid email is required'),
    body('password').notEmpty().withMessage('Password is required')
  ]
};

const propertyValidation = {
  create: [
    body('title').trim().notEmpty().withMessage('Title is required'),
    body('type').isIn(['land', 'house', 'apartment', 'commercial']).withMessage('Invalid property type'),
    body('location').trim().notEmpty().withMessage('Location is required'),
    body('area').isInt({ min: 1 }).withMessage('Area must be a positive number'),
    body('price').isFloat({ min: 0 }).withMessage('Price must be a positive number'),
    body('status').optional().isIn(['available', 'pending', 'sold']).withMessage('Invalid status'),
    body('sellerId').isInt({ min: 1 }).withMessage('Valid seller ID is required')
  ],
  update: [
    param('id').isInt({ min: 1 }).withMessage('Valid property ID is required'),
    body('title').optional().trim().notEmpty().withMessage('Title cannot be empty'),
    body('type').optional().isIn(['land', 'house', 'apartment', 'commercial']).withMessage('Invalid property type'),
    body('location').optional().trim().notEmpty().withMessage('Location cannot be empty'),
    body('area').optional().isInt({ min: 1 }).withMessage('Area must be a positive number'),
    body('price').optional().isFloat({ min: 0 }).withMessage('Price must be a positive number'),
    body('status').optional().isIn(['available', 'pending', 'sold']).withMessage('Invalid status'),
    body('sellerId').optional().isInt({ min: 1 }).withMessage('Valid seller ID is required')
  ],
  search: [
    query('keyword').optional().trim(),
    query('type').optional().isIn(['all', 'land', 'house', 'apartment', 'commercial']),
    query('status').optional().isIn(['all', 'available', 'pending', 'sold']),
    query('minPrice').optional().isFloat({ min: 0 }),
    query('maxPrice').optional().isFloat({ min: 0 })
  ]
};

const sellerValidation = {
  create: [
    body('name').trim().notEmpty().withMessage('Name is required'),
    body('email').isEmail().withMessage('Valid email is required'),
    body('phone').trim().notEmpty().withMessage('Phone is required'),
    body('company').optional().trim(),
    body('address').optional().trim()
  ],
  update: [
    param('id').isInt({ min: 1 }).withMessage('Valid seller ID is required'),
    body('name').optional().trim().notEmpty().withMessage('Name cannot be empty'),
    body('email').optional().isEmail().withMessage('Valid email is required'),
    body('phone').optional().trim().notEmpty().withMessage('Phone cannot be empty')
  ]
};

module.exports = {
  authValidation,
  propertyValidation,
  sellerValidation
};