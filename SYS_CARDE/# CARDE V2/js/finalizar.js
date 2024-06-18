/*<!-- HTML -->
<div id="minhaDiv">
  <!-- Conteúdo da div aqui -->
</div>
<button id="meuBotao">Ocultar Div</button>
*/

// finalizar.js
document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('btnfinalizarA').addEventListener('click', function(event) {
    console.log('Clique detectado');
    event.preventDefault();
    document.getElementById('manutencaoA').style.visibility = 'hidden';
  });
});

document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('btnfinalizarB').addEventListener('click', function(event) {
    console.log('Clique detectado');
    event.preventDefault();
    document.getElementById('manutencaoB').style.visibility = 'hidden';
  });
});

document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('btnfinalizarC').addEventListener('click', function(event) {
    console.log('Clique detectado');
    event.preventDefault();
    document.getElementById('manutencaoC').style.visibility = 'hidden';
  });
});