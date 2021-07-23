//
//  ViewController.swift
//  Parte3
//
//  Created by Robson Novato Lobao on 22/07/21.
//


import UIKit

fileprivate let cellReuse = "usersCell"
fileprivate let xibName = "UsersTableViewCell"

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : UsersViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UsersViewModel(delegate: self)
        setupTableView()
        viewModel.getData()
    }
    
    func setupTableView() {
        //tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: xibName, bundle: Bundle.main), forCellReuseIdentifier: cellReuse) //reutilizar as celulas de forma a serem printadas varias vezes
    }
}

extension UsersViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count //quantas vezes vai rodar a celula
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as! UsersTableViewCell
        cell.setupCell(user: viewModel.users[indexPath.row])
        return cell //Ela fala qual celula ela vai exibir, no caso é o xib e como vao ser suas configuracoes
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //define a altura da celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //ao clicar acontece isso
    }
}


extension UsersViewController: UsersDelegate {
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


