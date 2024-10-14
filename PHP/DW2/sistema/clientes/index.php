<?php
session_start();
// Incluir o arquivo de conexão com o banco de dados
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/conexao.php');
include($_SERVER['DOCUMENT_ROOT'] . '/dw2/central/fn/links.php');
include('../../central/fn/validar_sessao.php');

if (isset($_GET['filtro'])) 
 {
    $filtro = $_GET['filtro'];
 } 
 else 
  {
    $filtro = null;
  }

switch ($filtro) {
    
    case 'id':
        $sql = "SELECT * FROM clientes "; //ordena por id
        break;

    case 'az':
        $sql = "SELECT * FROM clientes ORDER BY nome_completo"; //de A a Z
        break;

    case 'za':
        $sql = "SELECT * FROM clientes ORDER BY nome_completo DESC"; //de A a Z
        break;
 
    case null:
        $sql = "SELECT * FROM clientes"; //ordena pelo id
        break;

}

// Criar a consulta SQL para selecionar todos os clientes
$result = mysqli_query($conexao, $sql);
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
                    <th>Idade</th>
                    <th>Email</th>
                    <th>Telefone</th>
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

                        //Formatando a data para o pt-br
                        $data_nasc = date("d/m/Y", strtotime($row['dt_nasc']));

                        //calcular a idade do cliente
                        $data_nascimento = new DateTime($row['dt_nasc']);
                        $hoje = new DateTime();
                        $idade = $hoje->diff($data_nascimento)->y;
                        
                        echo "<tr>";
                        echo "<td>" . $row['id'] . "</td>";
                        echo "<td>" . $row['codigo'] . "</td>";
                        echo "<td>" . $row['nome_completo'] . "</td>";
                        echo "<td>" . $row['sexo'] . "</td>";
                        echo "<td>" . $data_nasc . "</td>";  // Exibindo a data de nascimento formatada
                        echo "<td>" .$idade."</td>"; // Exibindo a idade calculada
                        echo "<td>" . $row['email'] . "</td>";
                        echo "<td>" . $row['telefone'] . "</td>";
                        echo "<td><a href='cliente_editar.php?codigo=".$row['codigo']."'>Editar</a></td>";
                        echo "<td><a href='cliente_deletar.php?codigo=".$row['codigo']."'>DELETAR</a></td>";
                        echo "</tr>";
                    }
                } else {
                    // Caso não haja clientes cadastrados, exibir uma mensagem
                    echo "<tr><td colspan='8' style='text-align:center;'>Nenhum cliente cadastrado.</td></tr>";
                }
                // Fechar a conexão
                mysqli_close($conexao);
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>