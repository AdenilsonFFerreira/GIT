// JavaScript para mostrar e esconder a caixa de diálogo
document.getElementById('btnsalvar').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('msgSalvar').style.display = 'block';
  });
  
  document.getElementById('confirmarOk').addEventListener('click', function() {
    document.getElementById('msgSair').style.display = 'none';
  });
  