const mongoose = require('mongoose');

// Configurar a conexão com o MongoDB
mongoose.connect('mongodb://localhost:27017/investdb')
  .then(() => console.log('Conexão com o MongoDB bem-sucedida!'))
  .catch((error) => {
    console.error('Erro ao conectar ao MongoDB:', error);
    process.exit(1); // Encerra o processo se a conexão falhar
  });

module.exports = mongoose;