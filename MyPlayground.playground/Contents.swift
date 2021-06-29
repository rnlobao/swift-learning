import UIKit

var nome: String = "Arroz"
let felicidade: Int = 5
let calorias: Double = 79.5
let vegetal: Bool = false

//declarando funções

func alimentoconsumido () {
    print("o alimento consumido foi: \(nome)")
}

alimentoconsumido()

func alimentoconsumido2(_ nome: String, _ calorias: Double) {
    print("O Alimento consumido foi \(nome), com \(calorias)")
}
//O underline antes da variavel na função tem capacidade de omitir o tipo da variavel no parâmetro
alimentoconsumido2(nome, calorias)

alimentoconsumido2(nome, calorias)

//funciona como comentário
/*
 igual na linguagem c...
 */

//command e barra comenta todo o codigo selecionado
