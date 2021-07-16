//
//  ViewControllerViewModel.swift
//  Parte2
//
//  Created by Robson Novato Lobao on 16/07/21.
//

import Foundation


protocol ConfereDelegate {
    func showConfere(confere: String)
}

class ViewControllerViewModel {
    
    var delegate: ConfereDelegate?
    
    init(delegate: ConfereDelegate?) {
        self.delegate = delegate
    }
    
    func conferevalores(nome: String, idade: String, endereco: String, telefone: String) {
        var resposta: String
        if let nome = String?(nome) {
            if(nome.count < 3) {
                resposta = "O nome tem que ter no mínimo 3 strings"
            }
            else {
                resposta = "Ok"
            }
        }
        delegate?.showConfere(confere: resposta)
    }
}
