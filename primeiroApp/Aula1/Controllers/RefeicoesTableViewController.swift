//
//  RefeicoesTableViewController.swift
//  Aula1
//
//  Created by Robson Novato Lobao on 12/07/21.
//

import Foundation
import UIKit

class RefeicoesTableViewController: UITableViewController {
    let refeicoes = [Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Churros", felicidade: 3),
                     Refeicao(nome: "Pizza", felicidade: 2)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        return celula
    }
}
