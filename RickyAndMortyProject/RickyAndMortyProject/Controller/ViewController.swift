//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Robson Novato on 06/07/21.
//

import UIKit

fileprivate let cellReuse = "characterCell"
fileprivate let xibName = "CharacterTableViewCell"

class RickAndMortyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: xibName, bundle: Bundle.main), forCellReuseIdentifier: cellReuse)
    }
}

extension RickAndMortyViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //quantas vezes vai rodar a celular
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as! CharacterTableViewCell
        return cell //Ela fala qual celula ela vai exibir, no caso é o xib
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //define a altura da celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //ao clicar acontece isso
    }
}
