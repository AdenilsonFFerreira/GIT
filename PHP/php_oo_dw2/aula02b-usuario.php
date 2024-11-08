<?php

require "./aula02b-conexao.php";

class Usuario {
    private $conexao;

    public function __construct() {
        //inicializa a conexão com o banco de dados
        $conexao = new Conexao();
        $this->conexao = $conexao->conectar();
    }

    public function Listar() {
        if ($this->conexao) { //verifica se a conexao foi bem estabelecida
            $query_usuarios = "SELECT * FROM usuarios";
            $resultado_usuarios = $this->conexao->prepare($query_usuarios);
            $resultado_usuarios->execute();

            //retorna todos os resultados como array associativo
            return $resultado_usuarios->fetchAll(PDO::FETCH_ASSOC);
        } else {
            echo "Erro: Não foi possível estabelecer a conexão com o BD.";
            return [];
        }
    }
}

?>
