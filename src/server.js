const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// ================================
// 1. CORS CONFIGURATION
// ================================

const corsOptions = {
  origin: function (origin, callback) {
    // Cho phép requests không có origin (Postman, mobile apps, curl)
    if (!origin) return callback(null, true);
    
    // Danh sách origins được phép
    const allowedOrigins = [
      'http://localhost:3000',
      'http://localhost:3000/login',
      'http://127.0.0.1:3000',
      'http://127.0.0.1:3001'
    ];
    
    // Trong development cho phép tất cả
    if (process.env.NODE_ENV === 'development') {
      callback(null, true);
    } else if (allowedOrigins.indexOf(origin) !== -1) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
  allowedHeaders: [
    'Content-Type',
    'Authorization',
    'X-Requested-With',
    'Accept',
    'Origin'
  ],
  exposedHeaders: ['Authorization'],
  maxAge: 86400,
  optionsSuccessStatus: 204
};

// ✅ Chỉ cần dòng này - KHÔNG dùng app.options('*', ...)
app.use(cors(corsOptions));

// ================================
// 2. BODY PARSER MIDDLEWARE
// ================================

app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// ================================
// 3. REQUEST LOGGER
// ================================

app.use((req, res, next) => {
  const timestamp = new Date().toISOString();
  const origin = req.headers.origin || 'direct';
  console.log(`[${timestamp}] ${req.method} ${req.path} - Origin: ${origin}`);
  next();
});

// ================================
// 4. PUBLIC ROUTES
// ================================

app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'Real Estate API Server',
    version: '1.0.0',
    status: 'running',
    timestamp: new Date().toISOString()
  });
});

app.get('/api/health', (req, res) => {
  res.status(200).json({
    success: true,
    message: 'Server is healthy',
    uptime: process.uptime(),
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'development'
  });
});

app.get('/api', (req, res) => {
  res.json({
    success: true,
    message: 'Real Estate API',
    version: '1.0.0',
    endpoints: {
      public: [
        'GET  /',
        'GET  /api',
        'GET  /api/health',
        'POST /api/auth/login',
        'POST /api/auth/register'
      ],
      protected: [
        'GET  /api/auth/me',
        'GET  /api/properties',
        'GET  /api/sellers',
        'GET  /api/stats/dashboard'
      ]
    }
  });
});

app.get('/api/test', (req, res) => {
  res.json({
    success: true,
    message: 'Test endpoint working',
    cors: 'enabled',
    timestamp: new Date().toISOString()
  });
});

// ================================
// 5. API ROUTES
// ================================

const authRoutes = require('./routes/authRoutes');
const propertyRoutes = require('./routes/propertyRoutes');
const sellerRoutes = require('./routes/sellerRoutes');
const statsRoutes = require('./routes/statsRoutes');

app.use('/api/auth', authRoutes);
app.use('/api/properties', propertyRoutes);
app.use('/api/sellers', sellerRoutes);
app.use('/api/stats', statsRoutes);

// ================================
// 6. ERROR HANDLERS
// ================================

// 404 Not Found
app.use((req, res) => {
  console.log(`❌ 404: ${req.method} ${req.path}`);
  res.status(404).json({
    success: false,
    message: `Route ${req.method} ${req.path} not found`
  });
});

// Global Error Handler
app.use((err, req, res, next) => {
  console.error('❌ Error:', err.message);

  // CORS Error
  if (err.message === 'Not allowed by CORS') {
    return res.status(403).json({
      success: false,
      message: 'CORS: Origin not allowed'
    });
  }

  // JWT Errors
  if (err.name === 'JsonWebTokenError') {
    return res.status(401).json({
      success: false,
      message: 'Invalid token'
    });
  }

  if (err.name === 'TokenExpiredError') {
    return res.status(401).json({
      success: false,
      message: 'Token expired'
    });
  }

  // Default Error
  res.status(err.status || 500).json({
    success: false,
    message: err.message || 'Internal server error',
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
  });
});

// ================================
// 7. START SERVER
// ================================

const PORT = process.env.PORT || 5000;
let server;

const startServer = async () => {
  try {
    // Test database connection
    console.log('🔌 Testing database connection...');
    const { testConnection } = require('./config/database');
    const dbConnected = await testConnection();

    if (!dbConnected) {
      console.error('❌ Database connection failed!');
      console.log('⚠️  Server will start but DB features may not work');
    } else {
      console.log('✅ Database connected');
    }

    // Start server
    server = app.listen(PORT, '0.0.0.0', () => {
      console.log('\n' + '='.repeat(60));
      console.log('🚀 SERVER STARTED SUCCESSFULLY');
      console.log('='.repeat(60));
      console.log(`📍 URL:       http://localhost:${PORT}`);
      console.log(`🏥 Health:    http://localhost:${PORT}/api/health`);
      console.log(`🧪 Test:      http://localhost:${PORT}/api/test`);
      console.log(`🌍 Env:       ${process.env.NODE_ENV || 'development'}`);
      console.log('='.repeat(60) + '\n');
    });

  } catch (error) {
    console.error('❌ Failed to start server:', error);
    process.exit(1);
  }
};

// Graceful shutdown
process.on('SIGINT', () => {
  console.log('\n👋 Shutting down...');
  if (server) {
    server.close(() => {
      console.log('✅ Server closed');
      process.exit(0);
    });
  } else {
    process.exit(0);
  }
});

startServer();

module.exports = app;