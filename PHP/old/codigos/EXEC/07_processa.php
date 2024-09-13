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

$endereco_cliente = isset($_POST['endereco_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['endereco_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   '';  

$numero_cliente = isset($_POST['numero_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['numero_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   ''; 

$bairro_cliente = isset($_POST['bairro_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['bairro_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   ''; 

$complemento_cliente = isset($_POST['complemento_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['complemento_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   ''; 

$cidade_cliente = isset($_POST['cidade_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['cidade_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   '';    

$cep_cliente = isset($_POST['cep_cliente']) 
  ? 
  htmlspecialchars(trim(strip_tags($_POST['cep_cliente'])),
  ENT_QUOTES, 'UTF-8')
   : 
   ''; 


echo "Nome do cliente: $nome_cliente <br><br>";

echo "E-mail do cliente: $email_cliente <br><br>";

echo "Senha do cliente: $senha_cliente <br><br>";

echo "Endereço do cliente: $endereco_cliente <br><br>";

echo "Numero do cliente: $numero_cliente <br><br>";

echo "Bairro do cliente: $bairro_cliente <br><br>";

echo "Complmento do cliente: $complemento_cliente <br><br>";

echo "Cep do cliente: $cep_cliente <br><br>";
?>