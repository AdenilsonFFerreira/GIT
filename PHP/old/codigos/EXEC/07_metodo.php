<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <title>Exec 07 - formulario</title>
</head>
<body>
    <h2>Cadastro</h2>

    <form method="POST" action="07_processa.php">
        <label>Nome: </label>
        <input type="text" name="nome_cliente" placeholder="Digite o nome" required /><br><br>
        
        <label>E-mail: </label>
        <input type="email" name="email_cliente" placeholder="Digite o e-mail" required /><br><br>
        
        <label>Senha: </label>
        <input type="password" name="senha_cliente" placeholder="Digite a senha" required /><br><br>

        <label>Endereço: </label>
        <input type="text" name="endereco_cliente" placeholder="Digite o endereço" required /><br><br>

        <label>Numero: </label>
        <input type="text" name="numero_cliente" placeholder="Digite o numero da casa" required /><br><br>

        <label>Bairro: </label>
        <input type="text" name="bairro_cliente" placeholder="Digite o bairro" required /><br><br>

        <label>Complemento: </label>
        <input type="text" name="complemento_cliente" placeholder="Informe complemento" required /><br><br>

        <label>Cidade : </label>
        <input type="text" name="cidade_cliente" placeholder="Digite a cidade" required /><br><br>

        <label>Cep: </label>
        <input type="text" name="cep_cliente" placeholder="Digite o cep" required /><br><br>

        <input type="submit" value="Cadastrar" />

    </form>
</body>
</html>
