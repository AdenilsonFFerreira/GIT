const redis = require('redis');

// Cria o cliente Redis apontando para localhost e porta padrão
const client = redis.createClient({
  socket: {
    host: '127.0.0.1',
    port: 6379
  }
});

// Conecta ao Redis
client.connect()
  .then(() => {
    console.log('✅ Conectado ao Redis');

    // Testa gravação
    return client.set('teste', 'funcionando');
  })
  .then(() => {
    // Testa leitura
    return client.get('teste');
  })
  .then((valor) => {
    console.log('🔎 Valor armazenado:', valor);
    return client.quit();
  })
  .catch((err) => {
    console.error('❌ Erro ao conectar ao Redis:', err);
  });