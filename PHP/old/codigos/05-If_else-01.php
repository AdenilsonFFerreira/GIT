<?php
//Laço If Else

$saldo = 100;

if  ($saldo >= 0)
{
   echo "<br><br> Você tem um saldo positivo de R$ ". number_format($saldo, 2, ",",".")."<br>";
}
else
{
    echo "<br> Você tem um saldo positivo de R$ ". number_format($saldo, 2, ",",".")."<br><hr>";
}

$saldo = -10;

if  (!($saldo >= 0))
{
   echo "<br><br> Seu saldo está negativo em R$ ". number_format($saldo, 2, ",",".")."<br>";
}
else
{
    echo "<br> Você tem um saldo positivo de R$ ". number_format($saldo, 2, ",",".")."<br><hr>";
}

?>
