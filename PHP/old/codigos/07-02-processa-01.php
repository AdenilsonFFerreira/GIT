<?php

$nome_cliente  = htmlspecialchars($_GET['nome_cliente']  ?? '', ENT_QUOTES, 'UTF-8');
$email_cliente = htmlspecialchars($_GET['email_cliente'] ?? '', ENT_QUOTES, 'UTF-8');


echo "Nome do cliente: $nome_cliente <br><br>";

echo "E-mail do cliente: $email_cliente <br><br>";
