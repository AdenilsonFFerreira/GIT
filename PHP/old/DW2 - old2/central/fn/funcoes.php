<?php
//Função que cria o codigo do cliente
function gerarCodigoCliente() {
    $caracteres = 'QWERTYUPADFGHJKLZXCVM1234567890';
    
    $parte1 = substr(str_shuffle($caracteres), 0, 6);
    $parte2 = substr(str_shuffle($caracteres), 0, 6);
    
    return $parte1 . '-' . $parte2;
}
?>