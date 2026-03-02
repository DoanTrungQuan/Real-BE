const Property = require('../models/Property');
const Seller = require('../models/Seller');

// Get dashboard statistics
exports.getDashboardStats = async (req, res, next) => {
  try {
    const [
      totalProperties,
      availableProperties,
      totalSellers,
      totalValue
    ] = await Promise.all([
      Property.count(),
      Property.countByStatus('available'),
      Seller.count(),
      Property.getTotalValue()
    ]);

    res.json({
      success: true,
      data: {
        totalProperties,
        availableProperties,
        totalSellers,
        totalValue: parseFloat(totalValue)
      }
    });
  } catch (error) {
    next(error);
  }
};