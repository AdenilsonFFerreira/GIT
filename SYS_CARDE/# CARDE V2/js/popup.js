function mostrarDataHora() {
  const elementoDataHora = document.getElementById("datahora");

  function atualizarDataHora() {
      const agora = new Date();
      const diaSemana = agora.toLocaleString('pt-BR', { weekday: 'long' });
      const dataFormatada = agora.toLocaleString('pt-BR', { year: 'numeric', month: 'long', day: 'numeric' });
      const hora = agora.getHours();
      const minutos = agora.getMinutes();

      // Formate a hora e os minutos com dois dígitos
      const horaFormatada = hora.toString().padStart(2, '0');
      const minutosFormatados = minutos.toString().padStart(2, '0');

      // Exiba a data e a hora no formato "Dia da Semana, DD de Mês de Ano - HH:mm hs"
      const dataHoraCompleta = `${diaSemana.charAt(0).toUpperCase() + diaSemana.slice(1)}, ${dataFormatada} - ${horaFormatada}:${minutosFormatados} hs`;
      elementoDataHora.innerHTML = dataHoraCompleta;
  }

  // Atualize a data e a hora a cada segundo
  setInterval(atualizarDataHora, 1000);
}

// Função para mostrar o pop-up
function showPopup() {
// Verifica se o pop-up já foi mostrado
if (localStorage.getItem('popupShown') !== 'true') {
    var overlay = document.createElement('div');
    overlay.setAttribute('class', 'overlay');
    overlay.setAttribute('id', 'popupOverlay');
    overlay.innerHTML = `
      <div class="popup">
        <h1>ATENÇÃO USUÁRIO!!!</h1>
        <br>
        <h3>Manutenção preventiva de URGÊNCIA.</h3>
        <h3>POR FAVOR.</h3>
        <h3>ACESSAR MENU:</h3>
        <h1>MANUTENÇÃO.</h1>  
        <br><br>      
        <button style="background-color: #4CAF50; color: white; border-radius: 5px; padding: 10px 20px; border: none; cursor: pointer; font-size: 20px;" onclick="closePopup()">Fechar</button>
      </div>
    `;
    document.body.appendChild(overlay);
    overlay.style.display = 'block';

    // Marca que o pop-up foi mostrado
    localStorage.setItem('popupShown', 'true');
}
}

function closePopup() {
document.getElementById('popupOverlay').style.display='none';
}

// Adiciona as funções ao evento de carregamento da página
window.addEventListener('load', mostrarDataHora);
window.addEventListener('load', showPopup);
