<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include('conexao.php');

// Verificar se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Receber os dados do formulário
    $codigo        = $_POST['codigo'];
    $nome_completo = $_POST['nome_completo'];
    $sexo          = $_POST['sexo'];
    $dt_nasc       = $_POST['dt_nasc'];
    $email         = $_POST['email'];
    $telefone      = $_POST['telefone'];

    // Criar a consulta SQL para atualizar os dados na tabela clientes
    $sql = "UPDATE clientes SET 
            nome_completo = '$nome_completo',
                     sexo = '$sexo',
                  dt_nasc = '$dt_nasc',
                    email = '$email',
                 telefone = '$telefone'
            WHERE  codigo = '$codigo'";

    // Executar a consulta e verificar se foi bem-sucedida
    if (mysqli_query($conexao, $sql)) {
        //echo "Atualização realizada com sucesso!";
        header("Location: clientes_listar.php");
    } else {
        echo "Erro: " . $sql . "<br>" . mysqli_error($conexao);
    }
}
mysqli_close($conexao);
?>

