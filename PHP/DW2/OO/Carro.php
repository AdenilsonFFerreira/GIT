<?php
class Carro{
    //atributo da classe
    public $fabricante;
    public $modelo;
    public $cor;
    public $ano;

    //mmeuetodo para retornar o chassi (assumindo que seja um valor fixo para exemplo
    public function chassi () {
        return "ABC1234556XYZ";
    }

    //METODO PARA AS AÇÕES DO CARRO
    public function acelerar () {
        echo "o carro esrta acelerando...\n";
    }

    public function frear () {
        echo "o carro esta freando...\n";
    }

    public function buzinar () {
        echo "bip bip";
    }
}

//exemplo de uso da classe carro
$meuCarro = new Carro();
$meuCarro-> fabricante = "toyota";
$meuCarro-> modelo = "corola";
$meuCarro-> cor = "azul";
$meuCarro-> ano = 2020;

echo "Fabricante" . $meuCarro-> fabricante . "\n";
echo "modelo" . $meuCarro-> modelo . "\n";
echo "cor" . $meuCarro-> cor . "\n";
echo "ano" . $meuCarro-> ano . "\n";
echo "chassi" . $meuCarro-> chassi() . "\n";

$meuCarro-> acelerar();
$meuCarro-> frear();
$meuCarro-> buzinar();

?>