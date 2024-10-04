<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include('conexao.php');

$codigo = $_GET['codigo']; // O código do cliente vem como parâmetro na URL

$sql = "DELETE FROM CLIENTES WHERE  codigo = '$codigo'";

    // Executar a consulta e verificar se foi bem-sucedida
    if (mysqli_query($conexao, $sql)) {
        //echo "Atualização realizada com sucesso!";
        header("Location: clientes_listar.php");
    } else {
        echo "Erro: " . $sql . "<br>" . mysqli_error($conexao);
    }


mysqli_close($conexao);
?>

