//
//  ViewController.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 26/07/21.
//

import UIKit

fileprivate let cellReuse = "listCell"
fileprivate let xibName = "ListTableViewCell"

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : ListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListViewModel(delegate: self)
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

extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count //quantas vezes vai rodar a celula
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as! ListTableViewCell
        cell.setupCell(user: viewModel.users[indexPath.row])
        return cell //Ela fala qual celula ela vai exibir, no caso é o xib e como vao ser suas configuracoes
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //define a altura da celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //ao clicar acontece isso
        //let detail = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        if let detail = UIStoryboard(name: "Detail", bundle: .main).instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            //detail.modalPresentationStyle = .overFullScreen
            //present(detail, animated: true)
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

