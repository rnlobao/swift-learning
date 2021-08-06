//
//  ViewController.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 26/07/21.
// Fazer a detail e a add receber a funcao da viewModel

import UIKit

fileprivate let cellReuse = "listCell"
fileprivate let xibName = "ListTableViewCell"

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : ListViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.backgroundColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListViewModel(delegate: self)
        viewModel.getData()
        setupTableView()
    }
    
    
    
    func setupTableView() {
        //tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: xibName, bundle: Bundle.main), forCellReuseIdentifier: cellReuse)
    }
}

extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as! ListTableViewCell
        cell.setupCell(user: viewModel.users[indexPath.row], color: viewModel.myColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) 
        if let detail = UIStoryboard(name: "Detail", bundle: .main).instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            detail.user = viewModel.users[indexPath.row]
            let backButton = UIBarButtonItem()
            backButton.title = "Voltar"
            navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
            
            navigationController?.pushViewController(detail, animated: true)
        }
        
    }
}


extension ListViewController: ServiceDelegate {
    func dataSucess() {
        tableView.reloadData()
        tableView.backgroundColor = viewModel.myColor
    }
    
    func dataFail(error: Error) {
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

