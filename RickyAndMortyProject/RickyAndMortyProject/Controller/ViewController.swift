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
    
    var viewModel : RickAndMortyViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RickAndMortyViewModel(delegate: self)
        setupTableView()
        viewModel.getData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: xibName, bundle: Bundle.main), forCellReuseIdentifier: cellReuse) //reutilizar as celulas de forma a serem printadas varias vezes
    }
}

extension RickAndMortyViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count //quantas vezes vai rodar a celula
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as! CharacterTableViewCell
        cell.setupCell(user: viewModel.characters[indexPath.row])
        return cell //Ela fala qual celula ela vai exibir, no caso é o xib e como vao ser suas configuracoes
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //define a altura da celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //ao clicar acontece isso
    }
}


extension RickAndMortyViewController: RickAndMortyDelegate {
    func getDataSucess() {
        tableView.reloadData()
    }
    
    func getDataFail(error: Error) {
        let alert = UIAlertController(title: "Erro", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showLoad() {
        showSpinner(onView: view)
    }
    
    func removeLoad() {
        removeSpinner()
    }
    
    
}
