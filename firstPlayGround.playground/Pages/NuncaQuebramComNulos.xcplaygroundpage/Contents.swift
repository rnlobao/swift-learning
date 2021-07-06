import UIKit

class Refeicao {
    //atributos
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    //construtores
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totaldecalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        return total
    }
}

class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    
}
let refeicao = Refeicao(nome: "almoco", felicidade: "5")
//adicionando um item ao meu array da classe refeicao

print(refeicao.felicidade)
print(refeicao.nome)

let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijao", calorias: 90.0)
let contrafile = Item(nome: "Contra filé", calorias: 287.0)

refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contrafile)

print(refeicao.nome)

if let primeiroitemdalista = refeicao.itens.first {
    print(primeiroitemdalista.nome)
}


print(refeicao.totaldecalorias())
