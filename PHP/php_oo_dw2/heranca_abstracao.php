<?php
//classe pai 9super classe)
abstract class Animal{
    //metodo abstrato que deve ser implementado para outras classe
    abstract public function fazersom();
        /*classe animal: é uma classe abstrata, isso significa que vc pode instanciar ela diretamente 
        (não pode fazer por exemplo new Animal(), pos ela serve apenas como um molde para outras clase)
        */
}

//clase Cachorro que implementa o metodo abstrato animal
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