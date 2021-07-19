//
//  ViewController.swift
//  Parte2
//
//  Created by Robson Novato Lobao on 16/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    @IBOutlet weak var endereçoTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!

        
    var viewModel: ViewControllerViewModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewControllerViewModel(delegate: self)
    }

    @IBAction func actionButton(_ sender: Any) {
        viewModel?.conferevalores(nome: nomeTextField.text ?? "", idade: idadeTextField.text ?? "", endereco: endereçoTextField.text ?? "", telefone: telefoneTextField.text ?? "")
        //?? "" siginfica que, se for nula manda vazio
        }
    }

    extension ViewController: ConfereDelegate {
        
        func showConfere(confere: String, success: Bool) {
            let alert = UIAlertController(title: "ATENÇÃO:", message: confere.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: success ? "Salvar":"Ok", style: .destructive, handler: nil))
            if (success == true) {
                nomeTextField.text?.removeAll()
                idadeTextField.text?.removeAll()
                endereçoTextField.text?.removeAll()
                telefoneTextField.text?.removeAll()
            }
            self.present(alert, animated: true)
        }
    }


