//
//  ViewController.swift
//  Parte1
//
//  Created by Robson Novato Lobao on 15/07/21.
//

import UIKit

fileprivate let cellReuse = "AlunosCell"
fileprivate let xibName = "AlunosTableViewCell"

class AlunosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : AlunosViewModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AlunosViewModel()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: xibName, bundle: Bundle.main), forCellReuseIdentifier: cellReuse) //reutilizar as celulas de forma a serem printadas varias vezes
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData() //reload na tableview
    }
}

extension AlunosViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.alunos.count //quantas vezes vai rodar a celula
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as! AlunosTableViewCell
        cell.setupCell(user: viewModel.alunos[indexPath.row])
        return cell //Ela fala qual celula ela vai exibir, no caso é o xib e como vao ser suas configuracoes
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //define a altura da celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //ao clicar acontece isso
    }
}

