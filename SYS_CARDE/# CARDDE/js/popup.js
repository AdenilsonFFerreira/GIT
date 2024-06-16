/* *********************************************************************************************************** */
/* SCRIPT POPUP HOME*/

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

window.onload = function() {
  showPopup();
};
