<?php
//Operadores de atribuição

$a = 1;
$b = 2;
$c = 3;
$d = 4;
$resultado = 2;

echo "<br><br> <b>A = $a</b>, <b>B = $b</b>, <b>C = $c</b>, <b>D = $d</b> e <b>Resultado = $resultado</b><br><hr>";

$resultado = $resultado * $c;
echo '$resultado = $resultado * $c;'."<br>";
echo "O Valor da variável <b>Result</b> é $resultado .<br><hr>";

// +=

$resultado *= $d;
echo '<br>$resultado *= $d;<br>';
echo "O Valor da variável <b>Result</b> é $resultado .<br><hr>";

$resultado *= $c;
echo '<br>$resultado *= $c;<br>';
echo "O Valor da variável <b>Result</b> é $resultado .  //A variável result não foi zerada;<br><hr>";

?>
