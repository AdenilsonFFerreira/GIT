// JavaScript para mostrar e esconder a caixa de diálogo de saída

// Adiciona um event listener ao botão com ID 'btnSair'
document.getElementById('btnSair').addEventListener('click', function(event) {
  // Previne o comportamento padrão do evento (por exemplo, submissão de formulário)
  event.preventDefault();
  // Mostra a mensagem de sair alterando o estilo 'display' para 'block'
  document.getElementById('msgSair').style.display = 'block';
});

// Adiciona um event listener ao botão com ID 'confirmarSaida'
document.getElementById('confirmarSaida').addEventListener('click', function() {
  // Redireciona para a página de login quando a saída é confirmada
  window.location.href = 'login.html';
});

// Adiciona um event listener ao botão com ID 'cancelarSaida'
document.getElementById('cancelarSaida').addEventListener('click', function() {
  // Esconde a mensagem de sair alterando o estilo 'display' para 'none'
  document.getElementById('msgSair').style.display = 'none';
});
