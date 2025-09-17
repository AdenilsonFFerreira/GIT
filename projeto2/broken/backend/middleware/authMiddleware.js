const jwt = require('jsonwebtoken');

function autenticarToken(req, res, next) {
  const token = req.header('Authorization');

  if (!token) {
    return res.status(401).json({ mensagem: 'Acesso negado. Token não fornecido.' });
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