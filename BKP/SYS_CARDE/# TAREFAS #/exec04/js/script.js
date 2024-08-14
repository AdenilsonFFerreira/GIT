function Funcao01(){
    var n1 = prompt('Digite o primeiro numero:');
    var n2 = prompt('Digite o segundo numero:');

    var soma = parseFloat(n1) + parseFloat(n2);
    var subtracao = parseFloat(n1) - parseFloat(n2);
    var multiplicacao = parseFloat(n1) * parseFloat(n2);
    var divisao = parseFloat(n1) / parseFloat(n2);

    document.write('Resultado da soma é: ' + soma + '<br>');
    document.write('Resultado da subtracao é: ' + subtracao + '<br>');
    document.write('Resultado da multiplicação é: ' + multiplicacao + '<br>');
    document.write('Resultado da divisão é: ' + divisao);
    document.write('<br>' + '<br>')

    document.write('<button onclick="location.reload();">Voltar as Funções</button>');    
}   

function Funcao02(){
    var n1 = prompt('Digite a quantidade de horas:');
    var n2 = prompt('Digite a quantidade de minutos:');
    var n3 = prompt('Digite a quantidade de segundos:');
    
    var horas = parseFloat(n1) * 3600;
    var minutos = parseFloat(n2) * 60;

    var total = parseFloat(horas) + parseFloat(minutos) + parseFloat(n3);
   
    document.write('Resultado das horas, minutos e segundos é: ' + total + 's'); 
    document.write('<br>' + '<br>')
    
    document.write('<button onclick="location.reload();">Voltar as Funções</button>');
} 

function Funcao03(){
    var n1 = prompt('Digite a quantidade de segundos:');
    
    var horas = Math.floor(n1 / 3600);
    n1 %= 3600;
    var minutos = Math.floor(n1 / 60);
    var segundos = n1 % 60;                        
           
    document.write('O resultado da conversão é: ' + horas.toString().padStart(2, '0') + ':' + minutos.toString().padStart(2, '0') + ':' + segundos.toString().padStart(2, '0') + 'hs');
    document.write('<br>' + '<br>')

    document.write('<button onclick="location.reload();">Voltar as Funções</button>');
}

function Funcao04(){
    var n1 = prompt('Digite o valor de A: ');
    var n2 = prompt('Digite o valor de B: ');

    var n3 = parseFloat(n2);
    var n2 = parseFloat(n1);
    var n1 = parseFloat(n3);

    document.write('Agora o valor de A é:' + n1 + '<br>');
    document.write('Agora o valor de B é:' + n2);  
    document.write('<br>' + '<br>')

    document.write('<button onclick="location.reload();">Voltar as Funções</button>');
}

