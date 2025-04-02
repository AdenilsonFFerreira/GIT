//DEFINE AS ROTAS PARA GERENCIAR CLIENTES

const express = require('express');
const Cliente = require('../models/cliente');
const router = express.Router();

// Criar um novo cliente
router.post('/', async (req, res) => {
  try {
    const novoCliente = new Cliente(req.body);
    await novoCliente.save();
    res.status(201).send(novoCliente);
  } catch (error) {
    res.status(400).send({ erro: error.message });
  }
});

// Listar todos os clientes
router.get('/', async (req, res) => {
  try {
    const clientes = await Cliente.find();
    res.status(200).send(clientes);
  } catch (error) {
    res.status(500).send({ erro: error.message });
  }
});

module.exports = router;