function mostrarDataHora() {
    const elementoDataHora = document.getElementById("datahora"); // Substitua "demo" pelo ID do elemento onde você quer exibir a data e a hora

    function atualizarDataHora() {
        const agora = new Date();
        const diaSemana = agora.toLocaleString('pt-BR', { weekday: 'long' });
        const dataFormatada = agora.toLocaleString('pt-BR', { year: 'numeric', month: 'long', day: 'numeric' });
        const hora = agora.getHours();
        const minutos = agora.getMinutes();
        const segundos = agora.getSeconds();

        // Formate a hora, minutos e segundos com dois dígitos
        const horaFormatada = hora.toString().padStart(2, '0');
        const minutosFormatados = minutos.toString().padStart(2, '0');
        const segundosFormatados = segundos.toString().padStart(2, '0');

        // Exiba a data e a hora no formato "Dia da Semana, DD de Mês de Ano - HH:mm:ss hs"
        const dataHoraCompleta = `${diaSemana.charAt(0).toUpperCase() + diaSemana.slice(1)}, ${dataFormatada} - ${horaFormatada}:${minutosFormatados}:${segundosFormatados} hs`;
        elementoDataHora.innerHTML = dataHoraCompleta;
    }

    // Atualize a data e a hora a cada segundo
    setInterval(atualizarDataHora, 1000);
}