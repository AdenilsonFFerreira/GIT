<?php

//$numero = $_GET['numero'];
//url.... ?numero=100

if (isset($_GET['numero'])) 
{
    $numero = $_GET['numero'];
    $soma = 0;

    for ($i = 1; $i <= $numero; $i++) 
     {
        
        while ($i % 2 == 0) 
         {
            $soma += $i; 
            echo "Valor $i <br>";
            break; 
         }
     }
    
    echo "A soma dos números pares de 1 até $numero é: $soma";

} 
else 
{
    echo "Nenhum numero passado.";
}
?>


















