<?php

$home_web         = "http://localhost/dw2";
$home_sistema     = $home_web."/sistema";
$sistema_clientes = $home_sistema."/clientes";
$sistema_produtos = $home_sistema."/produtos";

function menuClientes() {
    // Tornando as variáveis globais acessíveis
    global $home_sistema, $sistema_clientes;

    $menu = "
    <div class='topnav' id='myTopnav'>
      <a href='$home_sistema/index2.php' class='active'>Sistema</a>
      <a href='$sistema_clientes/index.php?filtro=id'>Clientes Listar</a>
      <a href='$sistema_clientes/cliente_cadastrar.php'>Cliente Cadastrar</a>
      <a href='$home_sistema/sair.php'>Sair?</a>
      <a href='javascript:void(0);' class='icon' onclick='myFunction()'>
        <i class='fa fa-bars'></i>
      </a>
    </div>
    ";

    return $menu;
}

?>
