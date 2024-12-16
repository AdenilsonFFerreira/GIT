<?php
session_start();
// Incluir o arquivo de conexão com o banco de dados
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/conexao.php');
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/fn/links.php');
include('../../central/fn/validar_sessao.php');

if (isset($_GET['filtro'])) {
    $filtro = $_GET['filtro'];
} else {
    $filtro = null;
}

switch ($filtro) {
    case 'id':
        $sql = "SELECT * FROM produtos ORDER BY id_produto"; // Ordena por ID
        break;
    case 'nome':
        $sql = "SELECT * FROM produtos ORDER BY nome_produto"; // Ordena por Nome
        break;
    case 'preco':
        $sql = "SELECT * FROM produtos ORDER BY preco"; // Ordena por Preço
        break;
    case null:
        $sql = "SELECT * FROM produtos"; // Sem filtro
        break;
}

// Criar a consulta SQL para selecionar todos os produtos
$result = mysqli_query($conexao, $sql);
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../central/css/estilo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Lista de Produtos</title>
</head>
<body>
    <?php //echo menuProdutos(); ?>
    <div class="container">
        <h1>Lista de Produtos</h1>
        <div class='row'>
            Ordenar por: 
            <a href="produtos.php?filtro=nome">Nome</a> &nbsp; | &nbsp;
            <a href="produtos.php?filtro=preco">Preço</a> &nbsp; | &nbsp;
            <a href="produtos.php?filtro=id">ID</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Categoria</th>
                    <th>Descrição</th>
                    <th>Preço</th>
                    <th>Quantidade</th>
                    <th>Data de Registro</th>
                    <th>Data de Alteração</th>
                    <th>Ação</th>
                    <th>Deletar?</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Verificar se há resultados na consulta
                if (mysqli_num_rows($result) > 0) {
                    // Loop através de cada linha de resultado e exibi-la na tabela
                    while($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . $row['id_produto'] . "</td>";
                        echo "<td>" . $row['codigo_produto'] . "</td>";
                        echo "<td>" . $row['nome_produto'] . "</td>";
                        echo "<td>" . $row['categoria_produto'] . "</td>";
                        echo "<td>" . $row['descricao'] . "</td>";
                        echo "<td>R$ " . number_format($row['preco'], 2, ',', '.') . "</td>"; // Formatando o preço
                        echo "<td>" . $row['qtd'] . "</td>";
                        echo "<td>" . date("d/m/Y H:i:s", strtotime($row['dt_reg'])) . "</td>";
                        echo "<td>" . ($row['dt_alt'] ? date("d/m/Y H:i:s", strtotime($row['dt_alt'])) : '-') . "</td>";
                        echo "<td><a href='produto_editar.php?id=" . $row['id_produto'] . "'>Editar</a></td>";
                        echo "<td><a href='produto_deletar.php?id=" . $row['id_produto'] . "'>DELETAR</a></td>";
                        echo "</tr>";
                    }
                } else {
                    // Caso não haja produtos cadastrados, exibir uma mensagem
                    echo "<tr><td colspan='11' style='text-align:center;'>Nenhum produto cadastrado.</td></tr>";
                }
                // Fechar a conexão
                mysqli_close($conexao);
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
