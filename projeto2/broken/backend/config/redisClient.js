const redis = require('redis');

const client = redis.createClient({
  socket: {
    host: '127.0.0.1',
    port: 6379
  }
});

client.connect()
  .then(() => console.log('✅ Redis conectado'))
  .catch(err => console.error('❌ Erro Redis:', err));

module.exports = client;