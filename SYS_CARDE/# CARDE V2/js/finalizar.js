// Adiciona um ouvinte de evento após o carregamento completo do conteúdo do DOM
document.addEventListener('DOMContentLoaded', function() {
  // Adiciona um ouvinte de evento ao botão com ID 'btnfinalizarA'
  document.getElementById('btnfinalizarA').addEventListener('click', function(event) {
    // Registra um log no console quando o botão é clicado
    console.log('Clique detectado');
    // Previne o comportamento padrão do evento (por exemplo, submissão de formulário)
    event.preventDefault();
    // Oculta o elemento com ID 'manutencaoA' alterando a propriedade 'visibility'
    document.getElementById('manutencaoA').style.visibility = 'hidden';
  });
});

// Repete o processo para os botões 'btnfinalizarB' e 'btnfinalizarC'
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
