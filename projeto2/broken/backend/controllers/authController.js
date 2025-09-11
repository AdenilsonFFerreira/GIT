const authService = require('../services/authService');
const { validationResult } = require('express-validator');

exports.login = async (req, res) => {
  const erros = validationResult(req);
  if (!erros.isEmpty()) {
    return res.status(400).json({ erros: erros.array() });
  }

  const { email, senha } = req.body;
  const resultado = await authService.validarLogin(email, senha);

  if (resultado.sucesso) {
    const token = authService.gerarToken(email);
    authService.registrarLog(email); // log de acesso

    res.status(200).json({
      mensagem: 'Login realizado com sucesso',
      token,
      dados: resultado.dados
    });
  } else {
    res.status(401).json({ mensagem: 'Credenciais inválidas' });
  }
};