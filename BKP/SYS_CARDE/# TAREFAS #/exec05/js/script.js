
function Funcao01() {    
    var n1 = parseFloat(prompt("Digite um número:"));
    if (n1 % 2 === 0)
    {
        document.write("O número " + n1 + " é par.");
    } else {
        document.write("O número " + n1 + " é impar.");
    }
    document.write('<br>' + '<br>')

    document.write('<button onclick="location.reload();">Voltar as Funções</button>');
}


function Funcao02() {
    var operacao = prompt("Digite a operação (+ (SOMA), - (SUBTRAÇÃO), / (DIVISÃO) ou * (MULTIPLICAÇÃO)):");
    var numero1 = parseFloat(prompt("Digite o primeiro número:"));
    var numero2 = parseFloat(prompt("Digite o segundo número:"));
    var noperacao, resultado;

    if (operacao === '+') {
        noperacao = 'Soma';
        resultado = numero1 + numero2;
    } else if (operacao === '-') {
        noperacao = 'Subtração';
        resultado = numero1 - numero2;
    } else if (operacao === '*') {
        noperacao = 'Multiplicação';
        resultado = numero1 * numero2;
    } else if (operacao === '/') {
        noperacao = 'Divisão';
        resultado = numero1 / numero2;
    } 
    document.write('O resultado da ' + noperacao + ' é ' + resultado);  
    document.write('<br>' + '<br>')

    document.write('<button onclick="location.reload();">Voltar às Funções</button>');
}

function Funcao03() {
    var horasTrabalhadas = parseFloat(prompt("Digite o número de horas trabalhadas:"));

    if (horasTrabalhadas <= 176){
        salarioTotal = horasTrabalhadas * 10;
    } else{
        horasExtras = horasTrabalhadas - 176;
        salarioTotal = (176*10) + (horasExtras*20);
    }
    document.write('O Salario mensal é de R$ ' + salarioTotal + ',00 reais.' );
    document.write('<br>' + '<br>')

    document.write('<button onclick="location.reload();">Voltar às Funções</button>');
}

function Funcao04() {
    var n1 = parseFloat(prompt("Digite o primeiro numero:"));
    var n2 = parseFloat(prompt("Digite o segundo numero:"));
    var n3 = parseFloat(prompt("Digite o terceiro numero:"));
    
    var maior = Math.max(n1, n2, n3);
    var menor = Math.min(n1, n2, n3);
    var media = (n1 + n2 + n3) / 3;
    var decmedia = media.toFixed(2);

    document.write('O maior numero é: ' + maior + ', o menor numero é: ' + menor + ' e a media: ' + decmedia);
    document.write('<br>' + '<br>')

    document.write('<button onclick="location.reload();">Voltar às Funções</button>');

}
