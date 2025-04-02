//DEFINE O ESQUEMA  DA COLEÇÃO CLIENTES
 
const mongoose = require('../db');

const clienteSchema = new mongoose.Schema({
  nome: { type: String, required: true },
  nomeUsuario: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  senhaHash: { type: String, required: true },
  telefone: { type: String, required: true },
  endereco: {
    rua: { type: String, required: true },
    numero: { type: Number, required: true },
    bairro: { type: String, required: true },
    cidade: { type: String, required: true },
    cep: { type: String, required: true }
  },
  dataCadastro: { type: Date, default: Date.now },
  tipoConta: { type: String, enum: ["cliente", "operador"], default: "cliente" },
  status: { type: String, enum: ["ativo", "inativo"], default: "ativo" }
});

const Cliente = mongoose.model('Cliente', clienteSchema);

module.exports = Cliente;