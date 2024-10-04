<?php
session_start();
// Incluir o arquivo de conexão com o banco de dados
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/conexao.php');
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/fn/links.php');
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/fn/funcoes.php');
include('../../central/fn/validar_sessao.php');
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../central/css/estilo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Cadastro de Clientes</title>
</head>
<body>
    <?php echo menuClientes(); ?> 
    <div class="container">
        <h1>Cadastro de Clientes</h1>
        <form action="cliente_cadastrar_exec.php" method="POST">
            <label for="codigo">Código</label>
            <input type="text" id="codigo" name="codigo" value="<?php echo gerarCodigoCliente() ?>" readonly maxlength="50">

            <label for="nome_completo">Nome Completo</label>
            <input type="text" id="nome_completo" name="nome_completo" value="" maxlength="255" required>

            <label for="sexo">Sexo</label>
            <select id="sexo" name="sexo" required>
                <option value="masculino">Masculino</option>
                <option value="feminino">Feminino</option>
            </select>

            <label for="dt_nasc">Data de Nascimento</label>
            <input type="date" id="dt_nasc" name="dt_nasc" value="" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="" maxlength="255" required>

            <label for="telefone">Telefone</label>
            <input type="tel" id="telefone" name="telefone" value="" maxlength="11" required>

            <input type="submit" value="Cadastrar">
        </form>
    </div>
</body>
</html>
