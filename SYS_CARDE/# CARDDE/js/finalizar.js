/*<!-- HTML -->
<div id="minhaDiv">
  <!-- Conteúdo da div aqui -->
</div>
<button id="meuBotao">Ocultar Div</button>
*/

// finalizar.js
document.getElementById('btnfinalizar').addEventListener('click', function(event) {
    event.preventDefault(); // Previne o comportamento padrão do botão de submit
    document.getElementById('minhaDiv').style.display = 'none';
  });
  