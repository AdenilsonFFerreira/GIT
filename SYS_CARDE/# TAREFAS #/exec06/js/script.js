
function Funcao01() {
    var n1 = parseFloat(prompt("Digite um número:"));

    if (n1 <= 0 || !Number.isInteger(n1)) {
      document.write("Insira um número inteiro positivo.");
      return;
    }
  
    var soma = 0;
  
    for (var i = 1; i <= n1; i++) {
      soma += i;
    }
  
    document.write('A soma de todos os **números** é: ' + soma); 
    document.write('<br>' + '<br>');

    document.write('<button onclick="location.reload();">Voltar às Funções</button>');    
}


  function Funcao02() { 
    var n1 = (prompt("Digite o valor de A:"));
    var n2 = (prompt("Digite o valor de B:"));
  
    if (isNaN(n1) || isNaN(n2)) {
        document.write('POR FAVOR!!! Digite Valores Validos.');  
        return;
    }
  
    if (n1 === n2) {
      document.write("Os valores A e B são iguais. Digite novos valores...");
      return;
    }  
   
    var resultado;
    if (n1 < n2) {
      resultado = n1 - n2;
      alert("A diferença de B - A é: " + resultado);
    } else {
      resultado = n1 - n2;
      alert("A diferença de A - B é: " + resultado);
    }
  }

/*
  function calcularFatorial(n) {
    // Verificar se o valor de n é válido (positivo e inteiro)
    if (n <= 0 || !Number.isInteger(n)) {
      alert("Insira um número inteiro positivo.");
      return;
    }
  
    // Variável para acumular o fatorial
    var fatorial = 1;
  
    // Loop para calcular o fatorial
    for (var i = 1; i <= n; i++) {
      fatorial *= i;
    }
  
    // Exibir o resultado do fatorial
    alert("O fatorial de " + n + " é: " + fatorial);
  }

  function menuMatematico() {
    // Loop para apresentar o menu e obter a escolha do usuário
    do {
      var escolha = parseInt(prompt("Escolha uma operação:\n1 - Somar\n2 - Subtrair\n3 - Multiplicar\n4 - Dividir\n5 - Sair"));
  
      // Validar a escolha do usuário
      if (isNaN(escolha) || escolha < 1 || escolha > 5) {
        alert("Escolha inválida. Digite um número entre 1 e 5.");
        continue;
      }
  
      // Obter os valores dos números
      var num1 = parseFloat(prompt("Digite o primeiro número:"));
      var num2 = parseFloat(prompt("Digite o segundo número:"));
  
      // Verificar se os valores são válidos (números)
      if (isNaN(num1) || isNaN(num2)) {
        alert("Insira valores numéricos válidos.");
        continue;
      }
  
      // Realizar a operação matemática de acordo com a escolha
      var resultado;
      switch (escolha) {
        case 1:
          resultado = num1 + num2;
          alert(num1 + " + " + num2 + " = " + resultado);
          break;
        case 2:
          resultado = num1 - num2;
          alert(num1 + " - " + num2 + " = " + resultado);
          break;
        case 3:
          resultado = num1 * num2;
          alert(num1 + " x " + num2 + " = " + resultado);
          break;
        case 4:
          if (num2 === 0) {

  ---------------------------------------------------*/          

            

/*function Funcao01() {    
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

}*/
