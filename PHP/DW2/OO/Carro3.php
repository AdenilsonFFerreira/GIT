<?php 

class Carro {
  // Definindo as propriedades explicitamente
  public $fabricante;
  public $modelo;
  public $cor;
  public $ano;

  private $carros = array();

  public function criarCarro($fabricante, $modelo, $cor, $ano) {
    // Criando uma nova instância de Carro e atribuindo valores às propriedades
    $carro = new Carro();
    $carro->fabricante = $fabricante;
    $carro->modelo = $modelo;
    $carro->cor = $cor;
    $carro->ano = $ano;
    $this->carros[] = $carro;
    return $carro;
  }

  public function lerCarros() {
    return $this->carros;
  }

  public function lerCarro($indice) {
    if (isset($this->carros[$indice])) {
      return $this->carros[$indice];
    } else {
      return null;
    }
  }

  public function atualizarCarro($indice, $fabricante, $modelo, $cor, $ano) {
    if (isset($this->carros[$indice])) {
      $carro = $this->carros[$indice];
      $carro->fabricante = $fabricante;
      $carro->modelo = $modelo;
      $carro->cor = $cor;
      $carro->ano = $ano;
      return $carro;
    } else {
      return null;
    }
  }

  public function deletarCarro($indice) {
    if (isset($this->carros[$indice])) {
      unset($this->carros[$indice]);
      // Reorganizando o array após a remoção
      $this->carros = array_values($this->carros);
      return true;
    } else {
      return false;
    }
  }
}

// Exemplo de uso do CRUD
$newCarro = new Carro();

// Criar um carro
$carro = $newCarro->criarCarro("Toyota", "Corolla", "Azul", 2020);
echo "Carro criado com sucesso!\n";

// Ler todos os carros
$carros = $newCarro->lerCarros();
echo "Lista de carros:\n";
foreach ($carros as $index => $carro) {
  echo "Carro $index - Fabricante: " . $carro->fabricante . ", Modelo: " . $carro->modelo . ", Cor: " . $carro->cor . ", Ano: " . $carro->ano . "\n";
}

// Ler um carro específico
$carro = $newCarro->lerCarro(0);
if ($carro) {
  echo "\nDetalhes do carro no índice 0:\n";
  echo "Fabricante: " . $carro->fabricante . "\n";
  echo "Modelo: " . $carro->modelo . "\n";
  echo "Cor: " . $carro->cor . "\n";
  echo "Ano: " . $carro->ano . "\n";
}

// Atualizar um carro
$newCarro->atualizarCarro(0, "Honda", "Civic", "Vermelho", 2022);
$carro = $newCarro->lerCarro(0);
if ($carro) {
  echo "\nCarro atualizado no índice 0:\n";
  echo "Fabricante: " . $carro->fabricante . "\n";
  echo "Modelo: " . $carro->modelo . "\n";
  echo "Cor: " . $carro->cor . "\n";
  echo "Ano: " . $carro->ano . "\n";
}

// Deletar um carro
$newCarro->deletarCarro(0);
$carros = $newCarro->lerCarros();
echo "\nCarros restantes: " . count($carros) . "\n";