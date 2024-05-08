function Funcao01() {
  var n1 = parseFloat(prompt("Digite um número:"));

  if (n1 <= 0 || !Number.isInteger(n1)) {
      document.write("Insira um número inteiro positivo.");
      document.write('<br>' + '<br>');

      document.write('<button onclick="location.reload();">Voltar às Funções</button>'); 
  } else {
      var soma = 0;

      for (var i = 1; i <= n1; i++) {
          soma += i;
      }

      document.write('A soma de todos os **números** é: ' + soma); 
      document.write('<br>' + '<br>');

      document.write('<button onclick="location.reload();">Voltar às Funções</button>');
  }    
}


function Funcao02() { 
  var n1 = Number(prompt("Digite o valor de A:"));
  var n2 = Number(prompt("Digite o valor de B:")); 

  if (Number.isInteger(n1) && Number.isInteger(n2)) {
      if (n1 === n2) {
          document.write('O valor de A e B são iguais');
          document.write('<br>' + '<br>');

          document.write('<button onclick="location.reload();">Voltar às Funções</button>');
      } else {
          var resultado;
          if (n1 < n2) {
              resultado = n2 - n1;
              document.write("A diferença de B - A é: " + resultado);
              document.write('<br>' + '<br>');

              document.write('<button onclick="location.reload();">Voltar às Funções</button>');
          } else {
              resultado = n1 - n2;
              document.write("A diferença de A - B é: " + resultado);
              document.write('<br>' + '<br>');

              document.write('<button onclick="location.reload();">Voltar às Funções</button>');
          } 
      }
  } else {
      document.write('Um ou ambos os números não são inteiros.');
      document.write('<br>' + '<br>');

      document.write('<button onclick="location.reload();">Voltar às Funções</button>');    
  }
}

function Funcao03() {
  var entrada = prompt("Digite um número:");
  var n1 = parseFloat(entrada);

  if (!Number.isInteger(n1) || n1 <= 0 || entrada.trim() !== n1.toString()) {
      document.write("Insira um número inteiro positivo.");
      document.write('<br>' + '<br>');
      document.write('<button onclick="location.reload();">Voltar às Funções</button>'); 
  } else {
      var fatorial = 1;
      for (var i = 1; i <= n1; i++) {
          fatorial *= i;
      }
      document.write('O fatorial de ' + n1 + ' é: ' + fatorial);
      document.write('<br>' + '<br>');
      document.write('<button onclick="location.reload();">Voltar às Funções</button>');    
  }
}

function Funcao04() {
  while (true) {
      var opcao = parseInt(prompt("Escolha uma opção:\n1  Somar\n2  Subtrair\n3  Multiplicar\n4  Dividir\n5  Sair"));

      if (opcao === 5) {
          break;
      }

      var n1 = parseFloat(prompt("Digite o primeiro número:"));
      var n2 = parseFloat(prompt("Digite o segundo número:"));

      switch (opcao) {
          case 1:
              alert("Resultado: " + (n1 + n2));
              break;
          case 2:
              alert("Resultado: " + (n1 - n2));
              break;
          case 3:
              alert("Resultado: " + (n1 * n2));
              break;
          case 4:
              if (n2 !== 0) {
                  alert("Resultado: " + (n1 / n2));
              } else {
                  alert("Erro: Divisão por zero não é permitida.");
              }
              break;
          default:
              alert("Opção inválida.");
      }
  }
}
