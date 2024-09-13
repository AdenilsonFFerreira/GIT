<?php

$nome_cliente = isset($_POST['nome_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['nome_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   '';

$email_cliente = isset($_POST['email_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['email_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   '';

 $senha_cliente = isset($_POST['senha_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['senha_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   '';  

echo "Nome do cliente: $nome_cliente <br><br>";

echo "E-mail do cliente: $email_cliente <br><br>";

echo "Senha do cliente: $senha_cliente <br><br>";
?>