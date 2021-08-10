//
//  ViewController.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 29/07/21.
//

import UIKit


class AddViewController: UIViewController {
        
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var usersList: ListViewController?
    var result: ListResult?
    var addViewModel: AddViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        addViewModel?.backgroundColor()
        self.view.backgroundColor = addViewModel?.myColor
    }
    
    override func viewDidLoad() {
        addViewModel = AddViewModel(delegate: self)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        guard let nameAdded = nameTextField?.text else {
            return
        }
        guard let emailAdded = emailTextField?.text else {
            return
        }
        addViewModel?.postData(name: nameAdded, job: emailAdded)
    }
}


extension AddViewController : ServiceDelegate {
    func dataSucess() {
        let alert = UIAlertController(title: "Enviado com sucesso", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action:UIAlertAction!) in
            self.nameTextField.text?.removeAll()
            self.emailTextField.text?.removeAll()
        }))
        self.present(alert, animated: true)
    }
    
    func dataFail(error: Error) {
        let alert = UIAlertController(title: "Erro", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showLoad() {
        showSpinner(onView: view)
    }
    
    func removeLoad() {
        removeSpinner()
    }
}
