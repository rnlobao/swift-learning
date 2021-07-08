//
//  ViewController.swift
//  tabela-dinamica-refeicoes
//
//  Created by Robson Novato Lobao on 08/07/21.
//

import UIKit

class ViewController: UITableViewController {

    let refeicoes = ["Churros", "macarrao", "pizza"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View controller carregado")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao
        return celula
    }

}

