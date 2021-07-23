//
//  UsersTableViewCell.swift
//  Parte3
//
//  Created by Robson Novato Lobao on 22/07/21.
//

import UIKit
import Nuke

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    
    
    func setupCell(user: Datum) {
        firstNameLabel.text = user.firstName ?? ""
        emailLabel.text = user.email ?? ""
        if let url = URL(string: user.avatar ?? "") {
                Nuke.loadImage(with: ImageRequest(url: url), into: iconImageView)
            }
        }
}
