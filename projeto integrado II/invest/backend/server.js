const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

mongoose.connect('mongodb://localhost:27017/investdb');

app.listen(5000, () => {
  console.log('Servidor rodando na porta 5000');
});


app.use('/api/auth', require('./routes/auth'));
