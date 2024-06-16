
/* *********************************************************************************************************** */
/* SCRIPT BOTÕES CADASTROS*/

document.addEventListener('DOMContentLoaded', function() {
    // Seus outros event listeners vão aqui
    document.getElementById('veiculo').addEventListener('click', function() {
        window.location.href = 'C:/GIT/SYS_CARDE/# CARDDE/cadastro_veiculo.html'; 
    });

    document.getElementById('estoque').addEventListener('click', function() {
        window.location.href = 'cadastro_estoque.html'; 
    });

    // Código para mostrar o pop-up personalizado
    showPopup();
});


