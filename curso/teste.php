/*<?php
    $variavel = "nome";
    
    echo $variavel;
?>*/

<html>
    <body>
        <?php
            //Função usada para definir fuso horário padrão 
            date_default_timezone_set('America/Los_Angeles');
            //Manipulando HMTL e PHP
            $data_hoje = date ("d/m/Y", time());
        ?>
        
        <p align="center"> Hoje é dia <?php echo $data_hoje ;?></p>
    </body>
</hmtl>

<html>
    <body>
        <?php   $cidade = "Natal";
                $estado = "RN";
                $idade = 400;
                
                $frase_capital = "A cidade de $cidade é a capital do $estado"; 
                $frase_idade = "$cidade tem mais de $idade anos"; 
                
                echo "<h3>$frase_capital </h3>";
                echo "<h4>$frase_idade </h4>"; 
        ?>
    </body>
</hmtl>

<?php
    //Criação do Array
    $carros = array('Palio','Corsa','Gol', "siena" =>"Siena");
    echo $carros[1] . "<br>"; //Resultado Corsa
    echo $carros["siena"] . "<br>"; //Resultado Siena
?>

<?php
class Computador
{
    var $cpu;
    function ligar()
    {
        echo "Ligando computador a {$this->cpu}...";
    }
}

$obj = new Computador;
$obj->cpu = "500Mhz";
$obj->ligar();
?>

<?php
$num = 5000;
    function escopo_funcao()
    {
        global $num;
        $num += 999;
        echo $num . "<br>";
    }
 echo $num . "<br>";
 escopo_funcao();
?>

<?php
    $string = "5";
    $numero = 3;
    $texto = "3 vezes campeão";
    
    echo $string+$numero;
?>

<?php
    $x = 50;
    $y = 2.35; 
    $soma = (int) $y + $x; 
    echo "<br>" . $soma . "<br>"; 
    $soma = (float)($y + $x); 
    echo $soma . "<br>";
?>

<?php
    $a = 20;
    $b = 20;
    //++$a;
    $a &= $b;
    echo $a;
?>