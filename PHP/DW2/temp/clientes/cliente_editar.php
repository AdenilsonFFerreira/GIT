<?php
session_start();
// Incluir o arquivo de conexão com o banco de dados
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/conexao.php');
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/fn/links.php');
include('../../central/fn/validar_sessao.php');

// Função para buscar os dados do cliente no banco de dados
function buscarCliente($codigo) {
    global $conexao;
    $sql = "SELECT * FROM clientes WHERE codigo = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("s", $codigo);
    $stmt->execute();
    $resultado = $stmt->get_result();
    return $resultado->fetch_assoc();
}

$codigoCliente = $_GET['codigo']; // O código do cliente vem como parâmetro na URL
$cliente = buscarCliente($codigoCliente);

if (!$cliente) {
    echo "Cliente não encontrado!";
    exit;
}

//var_dump($cliente);

?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../central/css/estilo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Edição de Cliente</title>
</head>
<body>
    <?php echo menuClientes(); ?> 
    <div class="container">
        <h1>Edição de Cliente</h1>
        <form action="cliente_editar_exec.php" method="POST">
            <label for="codigo">Código</label>
            <input type="text" id="codigo" name="codigo" 
            value="<?php echo $cliente['codigo']; ?>" readonly maxlength="50">

            <label for="nome_completo">Nome Completo</label>
            <input type="text" id="nome_completo" name="nome_completo" 
            value="<?php echo $cliente['nome_completo']; ?>" maxlength="255" required>

            <label for="sexo">Sexo</label>
            <select id="sexo" name="sexo" required>
                <option 
                value="masculino" <?php echo ($cliente['sexo'] == 'masculino') ? 'selected' : ''; ?>>Masculino</option>
                <option 
                value="feminino" <?php echo ($cliente['sexo'] == 'feminino') ? 'selected' : ''; ?>>Feminino</option>
            </select>

            <label for="dt_nasc">Data de Nascimento</label>
            <input type="date" id="dt_nasc" name="dt_nasc" 
            value="<?php echo $cliente['dt_nasc']; ?>" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" 
            value="<?php echo $cliente['email']; ?>" maxlength="255" required>

            <label for="telefone">Telefone</label>
            <input type="tel" id="telefone" name="telefone" 
            value="<?php echo $cliente['telefone']; ?>" maxlength="11" required>

            <input type="submit" value="Salvar Alterações">
        </form>
    </div>
</body>
</html>
