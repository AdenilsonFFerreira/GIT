<?php
//Laço If Else

$saldo = 100;

if  ($saldo >= 0)
{
    echo "<br><br>Seu saldo é de R$ ".number_format($saldo, 2, ",","."); 
    echo "<br>Selecione uma opção..."; 

    echo "<br>" 
        ."<button type='button'>Saque</button><br>"
        ."<button type='button'>Deposito</button><br><hr>";
}
else
{
    echo "<br><br>" 
    ."<button type='button'>Deposito</button><br><hr>";
}

$saldo = -10;

if  ($saldo >= 0)
{
    echo "<br><br>Seu saldo é de R$ ".number_format($saldo, 2, ",","."); 
    echo "<br>Selecione uma opção..."; 

    echo "<br>" 
        ."<button type='button'>Saque</button><br>"
        ."<button type='button'>Deposito</button><br><hr>";
}
else
{
    echo "<br><br>Seu saldo é de R$ ".number_format($saldo, 2, ",","."); 
    echo "<br><button type='button'>Deposito</button><br><hr>";
}

?>
