
// JavaScript para mostrar e esconder a caixa de diálogo
document.getElementById('btnSair').addEventListener('click', function(event) {
  event.preventDefault();
  document.getElementById('msgSair').style.display = 'block';
});

document.getElementById('confirmarSaida').addEventListener('click', function() {
  // Código para sair da aplicação ou navegar para login.html
  window.location.href = 'login.html';
});

document.getElementById('cancelarSaida').addEventListener('click', function() {
  document.getElementById('msgSair').style.display = 'none';
});
