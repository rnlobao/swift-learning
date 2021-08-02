//
//  ListViewModel.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 27/07/21.
//

import Foundation

protocol ServiceDelegate {
    func dataSucess()
    func dataFail(error: Error)
    func showLoad()
    func removeLoad()
}

class ListViewModel  {
    
    var service: ListService?
    var users: [Users] = []
    var delegate: ServiceDelegate?
    
    init(_ service: ListService? = ListService(), delegate: ServiceDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }
    
    
    func getData() {
        delegate?.showLoad()
        service?.getUsers(sucess: { result in
            self.users = result
            self.delegate?.dataSucess()
            self.delegate?.removeLoad()
        }, error: { error in
            self.delegate?.dataFail(error: error)
            self.delegate?.removeLoad()
        })
    }
}
