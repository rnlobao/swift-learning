//
//  ListTableViewCell.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 26/07/21.
//

import UIKit
import Nuke

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    
    
    func setupCell(user: Characters) {
        nameLabel.text = user.name ?? ""
            specieLabel.text = user.species ?? ""
            if let url = URL(string: user.image ?? "") {
                Nuke.loadImage(with: ImageRequest(url: url), into: iconImageView)
            }
        }
}
