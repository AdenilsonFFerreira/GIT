<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <title>PHP Orientado a Objetos</title>        
</head>
<body>
    <h2>Listar</h2>
    <?php
        //chamando o arquivo da classe usuario
        require "./aula02b-usuario.php";

        //cria o objeto usuario
        $usuarioListar = new Usuario();
        $resultado_usuarios = $usuarioListar->Listar();

        //percorre os resultados e exibe cada cidadão
        foreach ($resultado_usuarios as $usuario) {
            echo "Nome: " . $usuario['nome'] . "<br>";
            echo "Email: " . $usuario['email'] . "<br>";
        }
    ?>    
</body>
</html>
