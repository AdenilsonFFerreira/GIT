<?php
// Simulação de uma função para recuperar dados do cliente a partir do código
// No seu código real, você deve fazer uma consulta ao banco de dados.
function obterDadosCliente($codigo) {
    // Dados simulados para demonstração
    $clientes = [
        'ABC123-456DEF' => [
            'nome_completo' => 'João da Silva',
            'sexo' => 'masculino',
            'dt_nasc' => '1990-05-15',
            'email' => 'joao.silva@example.com',
            'telefone' => '11987654321'
        ],
        // Adicione mais clientes conforme necessário
    ];

    return $clientes[$codigo] ?? null;
}

// Obtendo o código do cliente da URL
$codigo_cliente = $_GET['codigo'] ?? '';
$dados_cliente = obterDadosCliente($codigo_cliente);

if (!$dados_cliente) {
    echo 'Cliente não encontrado.';
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo.css"/>
    <title>Editar Cliente</title>
</head>
<body>
    <div class="container">
        <h1>Editar Cliente</h1>
        <form action="cliente_editar_exec.php" method="POST">
            <input type="hidden" name="codigo" value="<?php echo htmlspecialchars($codigo_cliente); ?>">

            <label for="nome_completo">Nome Completo</label>
            <input type="text" id="nome_completo" name="nome_completo" value="<?php echo htmlspecialchars($dados_cliente['nome_completo']); ?>" maxlength="255" required>

            <label for="sexo">Sexo</label>
            <select id="sexo" name="sexo" required>
                <option value="masculino" <?php if ($dados_cliente['sexo'] === 'masculino') echo 'selected'; ?>>Masculino</option>
                <option value="feminino" <?php if ($dados_cliente['sexo'] === 'feminino') echo 'selected'; ?>>Feminino</option>
            </select>

            <label for="dt_nasc">Data de Nascimento</label>
            <input type="date" id="dt_nasc" name="dt_nasc" value="<?php echo htmlspecialchars($dados_cliente['dt_nasc']); ?>" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($dados_cliente['email']); ?>" maxlength="255" required>

            <label for="telefone">Telefone</label>
            <input type="tel" id="telefone" name="telefone" value="<?php echo htmlspecialchars($dados_cliente['telefone']); ?>" maxlength="11" required>

            <input type="submit" value="Atualizar">
        </form>
    </div>
</body>
</html>
