//
//  ViewControllerViewModel.swift
//  Parte2
//
//  Created by Robson Novato Lobao on 16/07/21.
//

import Foundation


protocol ConfereDelegate {
    func showConfere(confere: String, success: Bool)
}

class ViewControllerViewModel {
    
    var delegate: ConfereDelegate?
    
    init(delegate: ConfereDelegate?) {
        self.delegate = delegate
    }
    
    func conferevalores(nome: String, idade: String, endereco: String, telefone: String) {
        var resposta: String = "nada"
        if (nome.count < 3) {
            resposta = "O campo nome deve ter pelo menos 3 caracteres"
        }
        if (idade.isEmpty || nome.isEmpty || endereco.isEmpty || telefone.isEmpty) {
            resposta = "Nenhum campo pode ficar vazio"
        }
        if (telefone.count < 8) {
            resposta = "Campo telefone tem que ter no mínimo 8 carcteres"
        }
        if (!telefone.isInt){
            resposta = "Campo telefone so aceita numeros"
        }
        if (nome.count >= 3 && !idade.isEmpty && !nome.isEmpty && !endereco.isEmpty && !telefone.isEmpty && telefone.count >= 8 && telefone.isInt) {
            resposta = "Tudo certo"
            
        }
        
        delegate?.showConfere(confere: resposta, success: resposta == "Tudo certo")
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
