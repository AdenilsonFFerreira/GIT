/* *********************************************************************************************************** */
/* SCRIPT BOTÕES CADASTROS*/

// Adiciona um event listener que aguarda o carregamento completo do DOM
document.addEventListener('DOMContentLoaded', function() {
    // Aqui você pode adicionar outros event listeners conforme necessário

    // Adiciona um event listener ao elemento com ID 'veiculo'
    document.getElementById('veiculo').addEventListener('click', function() {
        // Redireciona para a página de cadastro de veículo quando o elemento é clicado
        window.location.href = 'C:/GIT/SYS_CARDE/# CARDDE/cadastro_veiculo.html'; 
    });

    // Adiciona um event listener ao elemento com ID 'estoque'
    document.getElementById('estoque').addEventListener('click', function() {
        // Redireciona para a página de cadastro de estoque quando o elemento é clicado
        window.location.href = 'cadastro_estoque.html'; 
    });

    // Chama a função para mostrar o pop-up personalizado
    showPopup();
});
