const { pool } = require('../config/database');

class Property {
  static async create(propertyData) {
    const { title, type, location, area, price, status = 'available', description, sellerId } = propertyData;
    const [result] = await pool.query(
      'INSERT INTO properties (title, type, location, area, price, status, description, seller_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [title, type, location, area, price, status, description || null, sellerId]
    );
    return result.insertId;
  }

  static async findById(id) {
    const [rows] = await pool.query(`
      SELECT 
        p.*,
        s.id as seller_id,
        s.name as seller_name,
        s.email as seller_email,
        s.phone as seller_phone,
        s.company as seller_company,
        s.address as seller_address
      FROM properties p
      LEFT JOIN sellers s ON p.seller_id = s.id
      WHERE p.id = ?
    `, [id]);

    if (rows.length === 0) return null;

    const property = rows[0];
    return this.formatProperty(property);
  }

  static async getAll() {
    const [rows] = await pool.query(`
      SELECT 
        p.*,
        s.id as seller_id,
        s.name as seller_name,
        s.email as seller_email,
        s.phone as seller_phone,
        s.company as seller_company,
        s.address as seller_address
      FROM properties p
      LEFT JOIN sellers s ON p.seller_id = s.id
      ORDER BY p.created_at DESC
    `);
    return rows.map(this.formatProperty);
  }

  static async search(filters) {
    let query = `
      SELECT 
        p.*,
        s.id as seller_id,
        s.name as seller_name,
        s.email as seller_email,
        s.phone as seller_phone,
        s.company as seller_company,
        s.address as seller_address
      FROM properties p
      LEFT JOIN sellers s ON p.seller_id = s.id
      WHERE 1=1
    `;
    const params = [];

    if (filters.keyword) {
      query += ` AND (p.title LIKE ? OR p.location LIKE ?)`;
      params.push(`%${filters.keyword}%`, `%${filters.keyword}%`);
    }

    if (filters.type && filters.type !== 'all') {
      query += ` AND p.type = ?`;
      params.push(filters.type);
    }

    if (filters.status && filters.status !== 'all') {
      query += ` AND p.status = ?`;
      params.push(filters.status);
    }

    if (filters.minPrice) {
      query += ` AND p.price >= ?`;
      params.push(filters.minPrice);
    }

    if (filters.maxPrice) {
      query += ` AND p.price <= ?`;
      params.push(filters.maxPrice);
    }

    query += ` ORDER BY p.created_at DESC`;

    const [rows] = await pool.query(query, params);
    return rows.map(this.formatProperty);
  }

  static async update(id, propertyData) {
    const fields = [];
    const values = [];

    const allowedFields = ['title', 'type', 'location', 'area', 'price', 'status', 'description', 'sellerId'];
    
    Object.keys(propertyData).forEach(key => {
      const dbKey = key === 'sellerId' ? 'seller_id' : key;
      if (allowedFields.includes(key) && propertyData[key] !== undefined) {
        fields.push(`${dbKey} = ?`);
        values.push(propertyData[key]);
      }
    });

    if (fields.length === 0) return false;

    values.push(id);
    await pool.query(
      `UPDATE properties SET ${fields.join(', ')} WHERE id = ?`,
      values
    );
    return true;
  }

  static async delete(id) {
    const [result] = await pool.query(
      'DELETE FROM properties WHERE id = ?',
      [id]
    );
    return result.affectedRows > 0;
  }

  static async count() {
    const [rows] = await pool.query('SELECT COUNT(*) as count FROM properties');
    return rows[0].count;
  }

  static async countByStatus(status) {
    const [rows] = await pool.query(
      'SELECT COUNT(*) as count FROM properties WHERE status = ?',
      [status]
    );
    return rows[0].count;
  }

  static async getTotalValue() {
    const [rows] = await pool.query('SELECT SUM(price) as total FROM properties');
    return rows[0].total || 0;
  }

  static formatProperty(row) {
    return {
      id: row.id,
      title: row.title,
      type: row.type,
      location: row.location,
      area: row.area,
      price: parseFloat(row.price),
      status: row.status,
      description: row.description,
      sellerId: row.seller_id,
      createdAt: row.created_at?.toISOString().split('T')[0],
      seller: row.seller_name ? {
        id: row.seller_id,
        name: row.seller_name,
        email: row.seller_email,
        phone: row.seller_phone,
        company: row.seller_company,
        address: row.seller_address
      } : null
    };
  }
}

module.exports = Property;