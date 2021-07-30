//
//  DetailViewController.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 30/07/21.
//

import UIKit

class DetailViewController: UIViewController {
 
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    var users : Datum!
    
    func setupDetail() {
        firstNameLabel.text = user.first_name ?? ""
        emailLabel.text = user.email ?? ""
        lastNameLabel.text = user.last_name ?? ""
        idLabel.text = user.id?.description ?? ""
    }
}
