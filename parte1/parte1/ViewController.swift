//
//  ViewController.swift
//  parte1
//
//  Created by Robson Novato Lobao on 14/07/21.
//

import UIKit

class ViewController: UITableViewController {
    let alunos = ["Zezim", "Ana", "Joao", "Fred", "Maria", "Katarina", "Jonas"]
    let idades = ["15", "15", "16", "13", "15", "14", "15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alunos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        celula.textLabel?.text = alunos[indexPath.row]
        celula.
        return celula
    }
}

