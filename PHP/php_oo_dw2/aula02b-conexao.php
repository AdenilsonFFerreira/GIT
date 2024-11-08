<?php

class Conexao {
    public $host = "localhost";
    public $dbname = "php_oo";
    public $user = "host";
    public $pass = "";
    public $port = "3306";
    public $conexao = null;

    public function conectar() {
        try {
            $this->conexao = new PDO(
                "mysql:host=" . $this->host .
                ";port=" . $this->port .
                ";dbname=" . $this->dbname,
                $this->user,
                $this->pass
            );
            $this->conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $this->conexao;
        } catch (Exception $php_error) {
            echo "Erro: Deu ruim. <br> Erro gerado:<br>" . $php_error->getMessage();
            return null;
        }
    }
}

?>
