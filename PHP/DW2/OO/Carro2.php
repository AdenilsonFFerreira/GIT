<?php
require_once 'Carro.php'; // Certifique-se de que o arquivo Carro.php está no mesmo diretório

// Instanciando a classe Carro
$dao = new Carro();

// Criando carros de exemplo
echo "Criando carros...</BR>";
$dao->criarCarro("Toyota", "Corolla", "Azul", 2020);
$dao->criarCarro("Honda", "Civic", "Vermelho", 2022);
$dao->criarCarro("Ford", "Fusion", "Branco", 2021);

// Exibindo todos os carros
echo "</BR>Lista de todos os carros:</BR>";
$carros = $dao->lerCarros();
foreach ($carros as $index => $carro) {
    echo "Carro $index - Fabricante: " . $carro->fabricante . ", Modelo: " . $carro->modelo . ", Cor: " . $carro->cor . ", Ano: " . $carro->ano . "</BR>";
}

// Lendo um carro específico (exemplo com índice 1)
echo "</BR>Lendo detalhes do carro no índice 1:</BR>";
$carro = $dao->lerCarro(1);
if ($carro) {
    echo "Fabricante: " . $carro->fabricante . "</BR>";
    echo "Modelo: " . $carro->modelo . "</BR>";
    echo "Cor: " . $carro->cor . "</BR>";
    echo "Ano: " . $carro->ano . "</BR>";
} else {
    echo "Carro não encontrado.</BR>";
}

// Atualizando um carro (exemplo com índice 0)
echo "</BR>Atualizando o carro no índice 0...</BR>";
$dao->atualizarCarro(0, "Chevrolet", "Onix", "Preto", 2023);
$carro = $dao->lerCarro(0);
if ($carro) {
    echo "Carro atualizado - Fabricante: " . $carro->fabricante . ", Modelo: " . $carro->modelo . ", Cor: " . $carro->cor . ", Ano: " . $carro->ano . "</BR>";
}

// Deletando um carro (exemplo com índice 2)
echo "</BR>Deletando o carro no índice 2...</BR>";
if ($dao->deletarCarro(2)) {
    echo "Carro deletado com sucesso!</BR>";
} else {
    echo "Falha ao deletar o carro.</BR>";
}

// Exibindo todos os carros restantes após a exclusão
echo "</BR>Lista de carros restantes:</BR>";
$carros = $dao->lerCarros();
foreach ($carros as $index => $carro) {
    echo "Carro $index - Fabricante: " . $carro->fabricante . ", Modelo: " . $carro->modelo . ", Cor: " . $carro->cor . ", Ano: " . $carro->ano . "</BR>";
}

?>