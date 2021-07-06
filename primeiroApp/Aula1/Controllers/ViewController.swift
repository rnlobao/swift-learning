//
//  ViewController.swift
//  Aula1
//
//  Created by Robson Novato Lobao on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    @IBAction func adicionar() {
        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
            let nome = nomeDaRefeicao
            if let felicidade = Int(felicidadeDaRefeicao) {
                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
                print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
            } else {
                print("Erro")
            }
            
        }
        
    }
}

