<?php
// Iniciar sessão
session_start();

// Incluir arquivo de conexão com o banco de dados
include('conexao.php');

// Verificar se o usuário está logado, ou seja, se existe um ID de funcionário na sessão
if (!isset($_SESSION['id_usuario'])) {
    // Se o usuário não estiver logado, redirecionar para a página de login
    header("Location: login.php");
    exit;
}

// Se o usuário está logado, verificar no banco de dados se ainda está ativo
$id_usuario = $_SESSION['id_usuario'];

$sql = "SELECT status FROM usuarios WHERE id_usuario = ? LIMIT 1";
$stmt = $conexao->prepare($sql);
$stmt->bind_param("i", $id_usuario);
$stmt->execute();
$stmt->bind_result($status);
$stmt->fetch();
$stmt->close();

// Se o status for diferente de '1' (inativo), redirecionar para o logout ou página de erro
if ($status !== '1') {
    header("Location: logout.php");
    exit;
}

// Se tudo estiver ok, o script continua a ser executado normalmente
?>