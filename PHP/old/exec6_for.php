<?php
$valor = 10;
$soma = 0; 

for ($cont = 1; $cont <= $valor; $cont++) {
    if ($cont % 2 === 0) {
        $soma += $cont;
    }
}

echo "soma = " . $soma;
?>
