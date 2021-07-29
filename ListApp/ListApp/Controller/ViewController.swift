//
//  ViewController.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 29/07/21.
//

import UIKit

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case otherProblem
}

struct APIRequest {
    let resourceURL: URL
    
    init (endpoint: String) {
        let resourceString = "https://reqres.in/api/users/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func save (_ userToSave: Datum, completion: @escaping(Result<Datum, APIError>) -> Void) {
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(userToSave)
            
            
            let dataTask = URL
        }
    }
    
}

class ViewController: UIViewController {
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
        
        let user = (nome: nameAdded, email: emailAdded)
        print("Nome: \(user.nome), Email: \(user.email)")

        
        
        
        
        
        
        
        
        
        
        navigationController?.popViewController(animated: true)
    }
}
