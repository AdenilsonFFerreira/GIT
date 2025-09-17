const express = require('express');
const router = express.Router();
const User = require('../models/User');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

router.post('/login', async (req, res) => {
  console.log('🔐 Rota /login acessada');

  const { email, senha } = req.body;
  console.log('📨 Dados recebidos:', email, senha);

  try {
    const usuario = await User.findOne({ email });
    console.log('👤 Usuário encontrado:', usuario);

    if (!usuario) {
      return res.status(400).json({ mensagem: 'Usuário não encontrado' });
    }

    const senhaValida = await bcrypt.compare(senha, usuario.senha);
    console.log('🔑 Senha válida?', senhaValida);

    if (!senhaValida) {
      return res.status(401).json({ mensagem: 'Senha incorreta' });
    }

    const token = jwt.sign({ id: usuario._id }, process.env.JWT_SECRET, {
      expiresIn: '1d'
    });

    console.log('🪙 Token gerado:', token);
    res.json({ token });
  } catch (err) {
    console.error('❌ Erro no login:', err);
    res.status(500).json({ mensagem: 'Erro ao fazer login', erro: err.message });
  }
});

// 👇 ESTA LINHA É ESSENCIAL
module.exports = router;

const autenticarToken = require('../middleware/authMiddleware');

router.get('/perfil', autenticarToken, async (req, res) => {
  try {
    const usuario = await User.findById(req.usuarioId).select('-senha');
    res.json(usuario);
  } catch (err) {
    res.status(500).json({ mensagem: 'Erro ao buscar perfil' });
  }
});