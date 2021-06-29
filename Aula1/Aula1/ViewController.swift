//
//  ViewController.swift
//  Aula1
//
//  Created by Robson Novato Lobao on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var felicidadeTextField: UITextField!

    @IBAction func adicionar() {
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        print("Comi \(nome) e fiquei com felicidade: \(felicidade)")
    }


}

