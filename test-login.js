const bcrypt = require('bcryptjs');
const mysql = require('mysql2/promise');
require('dotenv').config();

async function testLogin() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
  });

  // Test với admin
  const [users] = await connection.query(
    'SELECT * FROM users WHERE email = ?',
    ['admin@example.com']
  );

  if (users.length === 0) {
    console.log('❌ Admin user not found');
    return;
  }

  const user = users[0];
  console.log('👤 User found:', user.email);
  console.log('🔐 Stored hash:', user.password);

  // Test password
  const testPassword = 'admin123';
  const isValid = await bcrypt.compare(testPassword, user.password);
  
  console.log(`\n🧪 Testing password: ${testPassword}`);
  console.log(`✅ Password match: ${isValid}`);

  if (!isValid) {
    console.log('\n🔧 Generating new hash...');
    const newHash = await bcrypt.hash(testPassword, 10);
    console.log('New hash:', newHash);
    console.log('\nRun this SQL:');
    console.log(`UPDATE users SET password = '${newHash}' WHERE email = 'admin@example.com';`);
  }

  await connection.end();
}

testLogin();