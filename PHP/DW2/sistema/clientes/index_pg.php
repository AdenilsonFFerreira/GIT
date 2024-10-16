<?php
session_start();
// Incluir o arquivo de conexão com o banco de dados
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/conexao.php');
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/fn/links.php');
include('../../central/fn/validar_sessao.php');

// Pegar o valor de 'pg' da URL, ou definir como 10 por padrão
$limite = isset($_GET['pg']) ? (int)$_GET['pg'] : 10;
$pagina_atual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
$offset = ($pagina_atual - 1) * $limite;

// Verificar o filtro
$filtro = isset($_GET['filtro']) ? $_GET['filtro'] : null;

switch ($filtro) {
    case 'id':
        $sql = "SELECT * FROM clientes ORDER BY id LIMIT $limite OFFSET $offset"; // ordena por id
        break;
    case 'az':
        $sql = "SELECT * FROM clientes ORDER BY nome_completo LIMIT $limite OFFSET $offset"; // de A a Z
        break;
    case 'za':
        $sql = "SELECT * FROM clientes ORDER BY nome_completo DESC LIMIT $limite OFFSET $offset"; // de Z a A
        break;
    default:
        $sql = "SELECT * FROM clientes ORDER BY id LIMIT $limite OFFSET $offset"; // ordena pelo id
        break;
}

// Obter o total de clientes cadastrados
$total_sql = "SELECT COUNT(*) as total FROM clientes";
$total_result = mysqli_query($conexao, $total_sql);
$total_row = mysqli_fetch_assoc($total_result);
$total_clientes = $total_row['total'];

// Criar a consulta SQL para selecionar os clientes com paginação
$result = mysqli_query($conexao, $sql);

$clientes = [];
while ($row = mysqli_fetch_assoc($result)) {
    $clientes[] = $row;
}

// Fechar a conexão
mysqli_close($conexao);
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../central/css/estilo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Lista de Clientes</title>
</head>
<body>
    <?php echo menuClientes(); ?> 
    <div class="container">
        <h1>Lista de Clientes</h1>
        <div class='row'>
            Ordenar por: <a href="index.php?filtro=az"> Ordem A-Z </a> &nbsp;|&nbsp; <a href="index.php?filtro=za"> Ordem Z-A </a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código</th>
                    <th>Nome Completo</th>
                    <th>Sexo</th>
                    <th>Data de Nascimento</th>
                    <th>Email</th>
                    <th>Telefone</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Verificar se há resultados na consulta
                if (mysqli_num_rows($result) > 0) {
                    // Loop através de cada linha de resultado e exibi-la na tabela
                    foreach ($clientes as $cliente) {

                        //Formatando a data para o pt-br
                        $data_nasc = date("d/m/Y", strtotime($cliente['dt_nasc']));
                        
                        echo "<tr>";
                        echo "<td>" . $cliente['id'] . "</td>";
                        echo "<td>" . $cliente['codigo'] . "</td>";
                        echo "<td>" . $cliente['nome_completo'] . "</td>";
                        echo "<td>" . $cliente['sexo'] . "</td>";
                        echo "<td>" . $data_nasc . "</td>";  // Exibindo a data de nascimento formatada
                        echo "<td>" . $cliente['email'] . "</td>";
                        echo "<td>" . $cliente['telefone'] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    // Caso não haja clientes cadastrados, exibir uma mensagem
                    echo "<tr><td colspan='7' style='text-align:center;'>Nenhum cliente cadastrado.</td></tr>";
                }
                ?>
            </tbody>
        </table>
        <p>Total de clientes cadastrados: <?php echo $total_clientes; ?></p>
        <p>Mostrando <?php echo count($clientes); ?> de <?php echo $total_clientes; ?> clientes.</p>
        <p>Faltam <?php echo $total_clientes - ($pagina_atual * $limite) > 0 ? $total_clientes - ($pagina_atual * $limite) : 0; ?> clientes.</p>
    </div>
</body>
</html>
