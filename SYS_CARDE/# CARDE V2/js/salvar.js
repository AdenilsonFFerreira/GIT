// JavaScript para mostrar e esconder a caixa de diálogo

// Adiciona um event listener ao botão com ID 'btnsalvar'
document.getElementById('btnsalvar').addEventListener('click', function(event) {
  // Previne o comportamento padrão do evento (por exemplo, submissão de formulário)
  event.preventDefault();
  // Mostra a mensagem de salvar alterando o estilo 'display' para 'block'
  document.getElementById('msgSalvar').style.display = 'block';
});

// Adiciona um event listener ao botão com ID 'confirmarOk'
document.getElementById('confirmarOk').addEventListener('click', function() {
  // Esconde a mensagem de sair alterando o estilo 'display' para 'none'
  document.getElementById('msgSair').style.display = 'none';
});
