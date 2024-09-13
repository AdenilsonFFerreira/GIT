<?php
/*
02 - Exercicio
Crie um código em PHP que calcula o volume cúbico
de um cilindro seguindo os determinados parametros: 
altura = 3 metros
diametro = 1 metro
Exiba os resultados usando o formato brasileiro ABNT.
*/
$altura = 3; // altura em metros
$diametro = 1; // diâmetro em metros

// Calcular o raio
$raio = $diametro / 2;

// Calcular o volume
$volume = pi() * pow($raio, 2) * $altura;

// Exibir o volume
echo "O volume do cilindro é: " . $volume . " metros cúbicos.<br><br><vr>";
echo "Exibindo resultado segundo a norma brasileira.<br>";
echo "O volume do cilindro é: " . number_format($volume, 3, ",",".") . " metros cúbicos.<br><br><vr>";
?>
