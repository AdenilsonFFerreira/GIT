<?php

$nome_cliente = htmlspecialchars($_GET['nome_cliente'] ?? '', ENT_QUOTES, 'UTF-8');

$email_cliente = filter_input(INPUT_GET, "email_cliente", FILTER_SANITIZE_EMAIL);

echo "Nome do cliente: $nome_cliente <br><br>";

echo "E-mail do cliente: $email_cliente <br><br>";
