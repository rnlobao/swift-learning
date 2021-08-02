//
//  DetailViewController.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 30/07/21.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
 
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    
    func setupDetail(user: Users) {
        idLabel.text = user.id?.description ?? ""
        emailLabel.text = user.email ?? ""
        firstNameLabel.text = user.first_name ?? ""
        lastNameLabel.text = user.last_name ?? ""
        if let url = URL(string: user.avatar ?? "") {
            Nuke.loadImage(with: ImageRequest(url: url), into: avatarImageView)
        }
    }
}
