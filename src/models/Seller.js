const { pool } = require('../config/database');

class Seller {
  static async create(sellerData) {
    const { name, email, phone, company, address } = sellerData;
    const [result] = await pool.query(
      'INSERT INTO sellers (name, email, phone, company, address) VALUES (?, ?, ?, ?, ?)',
      [name, email, phone, company || null, address || null]
    );
    return result.insertId;
  }

  static async findById(id) {
    const [rows] = await pool.query(
      'SELECT * FROM sellers WHERE id = ?',
      [id]
    );
    return rows[0];
  }

  static async getAll() {
    const [rows] = await pool.query(
      'SELECT * FROM sellers ORDER BY created_at DESC'
    );
    return rows;
  }

  static async update(id, sellerData) {
    const fields = [];
    const values = [];

    Object.keys(sellerData).forEach(key => {
      if (sellerData[key] !== undefined) {
        fields.push(`${key} = ?`);
        values.push(sellerData[key]);
      }
    });

    if (fields.length === 0) return false;

    values.push(id);
    await pool.query(
      `UPDATE sellers SET ${fields.join(', ')} WHERE id = ?`,
      values
    );
    return true;
  }

  static async delete(id) {
    const [result] = await pool.query(
      'DELETE FROM sellers WHERE id = ?',
      [id]
    );
    return result.affectedRows > 0;
  }

  static async count() {
    const [rows] = await pool.query('SELECT COUNT(*) as count FROM sellers');
    return rows[0].count;
  }
}

module.exports = Seller;