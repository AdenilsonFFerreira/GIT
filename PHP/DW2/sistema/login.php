<?php
// Iniciar a sessão
session_start();

// Incluir o arquivo de conexão com o banco de dados
include('../central/conexao.php');

// Inicializar variáveis
$mensagem_erro = "";

// Verificar se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obter os dados do formulário de forma segura
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    // Criar a consulta SQL preparada para verificar o usuário
    $sql = "SELECT id_usuario, codigo, email, senha, status FROM usuarios WHERE email = ? LIMIT 1";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("s", $email); // "s" indica que o parâmetro é uma string
    $stmt->execute();
    $stmt->bind_result($id_usuario, $codigo, $email, $hash_senha, $status);
    $stmt->fetch();
    $stmt->close();

    // Verificar se o usuário existe e se a senha está correta
    if ($id_usuario && password_verify($senha, $hash_senha)) {
        if ($status == '1') {
            // Usuário autenticado com sucesso e ativo
            $_SESSION['id_usuario'] = $id_usuario;
            $_SESSION['codigo'] = $codigo;
            $_SESSION['email'] = $email;
            header("Location: dashboard.php"); // Redirecionar para uma página protegida
            exit;
        } else {
            // Usuário inativo
            $mensagem_erro = "Conta inativa. Entre em contato com o administrador.";
        }
    } else {
        // Email ou senha incorretos
        $mensagem_erro = "Email ou senha inválidos.";
    }
}

// Fechar a conexão
$conexao->close();
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../central/css/estilo.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <h1>Login</h1>

        <?php if (!empty($mensagem_erro)) { ?>
            <div class="erro"><?php echo $mensagem_erro; ?></div>
        <?php } ?>

        <form method="POST" action="login.php">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>

            <div class="form-group">
                <button type="submit">Entrar</button>
            </div>
        </form>
    </div>
</body>
</html>
