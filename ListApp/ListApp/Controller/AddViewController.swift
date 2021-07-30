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
    
    @IBAction func saveButton(_ sender: Any) {
        guard let nameAdded = nameTextField?.text else {
            return
        }
        guard let emailAdded = emailTextField?.text else {
            return
        }
        
        let parameters: [String:Any] = [
            "name": nameAdded,
            "job": emailAdded,
        ]
        
        
                
        navigationController?.popViewController(animated: true)
    }
}
