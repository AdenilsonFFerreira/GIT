const redis = require('../config/redisClient');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const tabelaCredenciais = 'usuarios:credenciais';
const tabelaDados = 'usuarios:dados';
const tabelaLogs = 'usuarios:logs';

exports.validarLogin = async (email, senhaDigitada) => {
  const credenciais = await redis.hGetAll(`${tabelaCredenciais}:${email}`);

  if (credenciais && credenciais.senha) {
    const senhaValida = await bcrypt.compare(senhaDigitada, credenciais.senha);

    if (senhaValida) {
      const dados = await redis.hGetAll(`${tabelaDados}:${email}`);
      return { sucesso: true, dados };
    }
  }

  return { sucesso: false };
};

exports.gerarToken = (email) => {
  const payload = { email };
  const token = jwt.sign(payload, 'segredo_super_secreto', { expiresIn: '1h' });
  return token;
};

exports.registrarLog = async (email) => {
  const timestamp = new Date().toISOString();
  await redis.lPush(`${tabelaLogs}:${email}`, timestamp);
};