const express = require('express');
const app = express();
const PORT = 3000;

// Importa as rotas principais e de autenticação
const routes = require('./routes');
const authRoutes = require('./routes/authRoutes');

// Middleware para interpretar JSON
app.use(express.json());

// Usa as rotas
app.use('/', routes);
app.use('/auth', authRoutes); // ← esta linha é essencial para ativar o login

app.listen(PORT, () => {
  console.log(`Servidor iniciado em http://localhost:${PORT}`);
});