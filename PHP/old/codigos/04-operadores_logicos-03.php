<?php
    
    $saldo = 100;
 
    if($a > 1)
     {
        $saldo = number_format($saldo, 2, ",",".");
        echo "Você tem R$ ".number_format($saldo, 2, ",",".").".<br>";
     }
    else
    {
        $saldo = number_format($saldo, 2, ",",".");
        echo "Você tem R$ ".number_format($saldo, 2, ",",".")." quer fazer um depósito?.<br>";       
    }
 

?>
