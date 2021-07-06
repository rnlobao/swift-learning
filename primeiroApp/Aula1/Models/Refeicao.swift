//
//  Refeicao.swift
//  Aula1
//
//  Created by Robson Novato Lobao on 06/07/21.
//

import UIKit

class Refeicao: NSObject {
    //atributos
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    //construtores
    init(nome: String, felicidade: Int) {
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
