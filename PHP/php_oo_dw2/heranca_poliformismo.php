<?php
//classe pai 9super classe)
class Animal{
    public function fazersom(){
        echo 'Som Generico</BR>';
    }
}

///classe filho que herda de animal
class Cachorro extends Animal{
    public function fazersom(){
        echo 'Latido</BR>';
    }
}   

///classe filho que herda de animal
class Gato extends Animal{
    public function fazersom(){
        echo 'Miau</BR>';
    }
} 

// função que aceita quealuer objeto do tipo animal e chama metodo fazersom()

function emitirsom(Animal $animal){
    $animal -> fazersom();
}

//criando estancias de cachorro e gato
$cachorro =  new Cachorro();
$gato = new Gato();
 
//chamando a função emitirsom() com diferentes objetos
emitirsom ($cachorro);
emitirsom ($gato);
?>