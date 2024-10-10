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
            header("Location: index2.php"); // Redirecionar para uma página protegida
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
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10pmx;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .login-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Login</h2>

        <!-- Exibir mensagem de erro -->
        <?php if (!empty($mensagem_erro)) { ?>
            <div class="error-message"><?php echo $mensagem_erro; ?></div>
        <?php } ?>

        <!-- Formulário de login -->
        <form method="POST" action="">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>

            <button type="submit" class="login-btn">Entrar</button>
        </form>
    </div>

</body>
</html>
