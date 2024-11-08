<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <title>PHP Orientado a Objetos</title>        
  </head>
  <body>
    <h2>Classes e Objetos</h2>
    <?php
                 
      //Abaixo eu chama meu programa para que eu possa instancia-lo
      require './Usuario.php';

      $usuario = new Usuario();
        // aqui em cima eu estou instanciando (chamando, incluindo)
        // $usuario é o objeto e agora posso usar o objeto na linha de baixo
      $msg = $usuario->cadastrar("Ricardo Alsoa", "ricardoalsoa.tt@gmail.com");
      echo $msg;
    ?>    
  </body>
</html>
