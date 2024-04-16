function mostrarDataHora() {
    var d = new Date();

    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
    var dataFormatada = d.toLocaleString('pt-BR', options);

    // Capitalize a primeira letra do dia da semana
    dataFormatada = dataFormatada.charAt(0).toUpperCase() + dataFormatada.slice(1).toLowerCase();

    // Substitua o "às" por um traço e adicione "hs" após os minutos
    dataFormatada = dataFormatada.replace('às', '-').replace(' ', '') + 'hs';

    // Adicione uma vírgula após o dia da semana
    dataFormatada = dataFormatada.replace(/(^\w+)(\s)/, '$1,$2');

    document.getElementById("demo").innerHTML = dataFormatada;
}
