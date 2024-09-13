<?php
/*
02 - Exercicio
Crie um código em PHP que calcula os metros quadrados
de um terreno com as seguintes dimenções:
largura = 7 metros
comprimento = 23 metros
Exiba os resultados usando o formato brasileiro ABNT.
*/
$largura = 7; // altura em metros
$comprimento = 23; // comprimento

// Calcular o raio
$m2 = $largura * $comprimento;

// Exibir o volume
echo "<br><hr>O Terreno com Largura de ".$largura." metros e Comprimento de ".$comprimento." metros <br>
      tem $m2 metros quadrados.<br><hr>";
?>
