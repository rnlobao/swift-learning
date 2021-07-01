import UIKit

//Criar primeira refeição
var nome = "Macarrão"
var felicidade = "5"

//Criar segunda refeição
var nome2 = "Churros"
var felicidade2 = "4"


// Usar classe que funciona como um struct em c

class Refeicao {
    var nome = "Macarrao"
    var felicidade = "5"
}

//Instanciando uma classe é como se tivesse passando o tipo da variavel como refeicao
let comidas = Refeicao()


print(comidas.nome)

class Refeicao2 {
    var nome = "Churros"
    var felicidade = "4"
}

let comida2 = Refeicao2()
print(comida2.nome)

//Usando uma classe para colocar qualquer valor
//Aqui ta falando que as variaveis nao tem incializacao de valor, ou seja sao opcionais
//Se voce usar uma exclamacao nas opcionais voce ta basicamente falando pro codigo, confia que eu sei oq eu to fazendo
class Refeicao3 {
    var nome: String?
    var felicidade: String?
}

let comidas3 = Refeicao3()
comidas3.nome = "Arroz"

print(comidas3.nome)
//Nesse primeiro vai aparecer opcional
print(comidas3.nome!)
//Aqui estamos usando um forced unwrap, esa=tamos forcando a extracao da variável
//Evite usar !


//Usando if para ver se tem conteudo dentro da variavel que estamos usando unforced pra nao dar bo
if comidas3.nome != nil {
    print(comidas3.nome!)
}


//Boas praticas para extrair valores opcionais, mas aqui voce usa so no escopo do if
if let verificador = comidas3.nome {
    print(verificador)
}

//o guard ket voce consegue usar na sua funcao inteira:
func exibenomedarefeicao() {
    if let nome = comidas3.nome {
        print(nome)
    }
    guard let nome = comidas3.nome else {
        return
    }
    print(nome)
}
exibenomedarefeicao()

//lev > var > opcionais


let numero = Int("5")
//aqui o 5 é um opcional, embora nao pareça
if let n = numero {
    print(n)
}
