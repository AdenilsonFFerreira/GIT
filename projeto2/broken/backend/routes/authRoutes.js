const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const { body } = require('express-validator');
const rateLimit = require('express-rate-limit');

// Limite de 5 tentativas por minuto
const limiter = rateLimit({
  windowMs: 60 * 1000,
  max: 5,
  message: 'Muitas tentativas de login. Tente novamente em 1 minuto.'
});

router.post(
  '/login',
  limiter,
  [
    body('email').isEmail().withMessage('Email inválido'),
    body('senha').isLength({ min: 6 }).withMessage('Senha deve ter no mínimo 6 caracteres')
  ],
  authController.login
);

module.exports = router;