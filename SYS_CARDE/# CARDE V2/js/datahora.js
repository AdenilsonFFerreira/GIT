// Função para mostrar data e hora atualizadas
function mostrarDataHora() {
    // Obtém o elemento HTML onde a data e hora serão exibidas
    const elementoDataHora = document.getElementById("datahora");

    // Função interna para atualizar data e hora
    function atualizarDataHora() {
        // Cria um novo objeto de data/hora
        const agora = new Date();
        // Obtém o dia da semana em português do Brasil
        const diaSemana = agora.toLocaleString('pt-BR', { weekday: 'long' });
        // Formata a data em português do Brasil
        const dataFormatada = agora.toLocaleString('pt-BR', { year: 'numeric', month: 'long', day: 'numeric' });
        // Obtém as horas e minutos atuais
        const hora = agora.getHours();
        const minutos = agora.getMinutes();

        // Formata a hora e os minutos com dois dígitos, adicionando um zero à esquerda se necessário
        const horaFormatada = hora.toString().padStart(2, '0');
        const minutosFormatados = minutos.toString().padStart(2, '0');

        // Monta a string de data e hora no formato desejado e atualiza o elemento HTML
        const dataHoraCompleta = `${diaSemana.charAt(0).toUpperCase() + diaSemana.slice(1)}, ${dataFormatada} - ${horaFormatada}:${minutosFormatados} hs`;
        elementoDataHora.innerHTML = dataHoraCompleta;
    }

    // Define um intervalo para atualizar a data e a hora a cada segundo (1000 milissegundos)
    setInterval(atualizarDataHora, 1000);
}

// Função para mostrar um popup (não detalhada)
function showPopup() {
    // Implementação não fornecida
}

// Quando a janela é carregada, executa as funções para mostrar data/hora e o popup
window.onload = function() {
    mostrarDataHora();
    showPopup();
};

