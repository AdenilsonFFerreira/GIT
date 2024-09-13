<?php
$contador = 1;

do {
    echo "Contador antes do incremento: $contador<br>";
    echo 'Execução do comando $contador++;';
    $contador++;
    echo "Contador depois do incremento: $contador<br>";
} while ($contador <= 7);
?>