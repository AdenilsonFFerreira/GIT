const jwt = require('jsonwebtoken');

function autenticarToken(req, res, next) {
  let token = req.header('Authorization');

  if (!token) {
    return res.status(401).json({ mensagem: 'Acesso negado. Token não fornecido.' });
  }

  // Remove o prefixo "Bearer " se estiver presente
  if (token.startsWith('Bearer ')) {
    token = token.slice(7).trim();
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.usuarioId = decoded.id;
    next();
  } catch (err) {
    res.status(400).json({ mensagem: 'Token inválido.' });
  }
}

module.exports = autenticarToken;