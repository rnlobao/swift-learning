//
//  ListTableViewCell.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 26/07/21.
//

import UIKit
import Nuke

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    func setupCell(user: Users, color: UIColor) {
        firstNameLabel.text = user.first_name ?? ""
        emailLabel.text = user.email ?? ""
        if let url = URL(string: user.avatar ?? "") {
            Nuke.loadImage(with: ImageRequest(url: url), into: avatarImage)
        }
        backgroundColor = color
    }
}
