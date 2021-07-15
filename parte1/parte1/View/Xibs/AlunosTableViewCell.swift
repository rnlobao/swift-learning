//
//  AlunosTableViewCel.swift
//  Parte1
//
//  Created by Robson Novato Lobao on 15/07/21.
//

import UIKit

class AlunosTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    
    
    func setupCell(user: Aluno) {
            nomeLabel.text = user.nome ?? ""
            idadeLabel.text = user.idade ?? ""
        }
}
