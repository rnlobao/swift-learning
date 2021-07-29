//
//  ListViewModel.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 27/07/21.
//

import Foundation

protocol ListDelegate {
    func getDataSucess()
    func getDataFail(error: Error)
    func showLoad()
    func removeLoad()
}

class ListViewModel  {
    
    var service: ListService?
    var users: [Datum] = []
    var delegate: ListDelegate?
    
    init(_ service: ListService? = ListService(), delegate: ListDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }
    
    
    func getData() {
        delegate?.showLoad()
        service?.getUsers(sucess: { result in
            self.users = result
            self.delegate?.getDataSucess()
            self.delegate?.removeLoad()
        }, error: { error in
            self.delegate?.getDataFail(error: error)
            self.delegate?.removeLoad()
        })
    }
    
}
