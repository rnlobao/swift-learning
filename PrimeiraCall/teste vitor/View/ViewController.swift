//
//  ViewController.swift
//  teste vitor
//
//  Created by Robson Novato Lobao on 02/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    var viewModel: ViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewControllerViewModel(delegate: self)
    }

    @IBAction func actionButton(_ sender: Any) {
            viewModel?.sum(number1: firstTextField.text ?? "", number2: secondTextField.text ?? "")
        }
    }

    extension ViewController: SumDelegate {
        
        func showSum(sum: Float) {
            let alert = UIAlertController(title: "O resultado e: ", message: sum.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            self.present(alert, animated: true)
        }
    }
