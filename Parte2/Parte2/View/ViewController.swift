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
        }
    }

    extension ViewController: SumDelegate {
        
        func showSum(sum: Float) {
            let alert = UIAlertController(title: "O resultado e: ", message: sum.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            self.present(alert, animated: true)
        }
    }


