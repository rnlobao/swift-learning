//
//  CharacterTableViewCell.swift
//  RickyAndMortyProject
//
//  Created by Robson Novato Lobao on 06/07/21.
//
//aqui a gente cria a funcao setupCell que vai ser chamada depois na ViewController
//essa funcao vai dar o a celula como tendo 2 labels com especie e nome e uma imagem carregada a partir do nuke com o loadImage
import UIKit
import Nuke

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    
    
    func setupCell(user: Character) {
            nameLabel.text = user.name ?? ""
            specieLabel.text = user.species ?? ""
            if let url = URL(string: user.image ?? "") {
                Nuke.loadImage(with: ImageRequest(url: url), into: iconImageView)
            }
        }
}
