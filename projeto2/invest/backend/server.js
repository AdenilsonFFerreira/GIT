//INICIA O SERVIDOR E CONECTA A ROTA
 
const express = require('express');
const mongoose = require('./db'); // Importa a configuração do banco
const clienteRoutes = require('./routes/clientes');

const app = express();
app.use(express.json()); // Middleware para interpretar JSON

// Rotas de clientes
app.use('/clientes', clienteRoutes);

const PORT = 3000;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}!`));