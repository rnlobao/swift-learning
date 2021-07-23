//
//  RickAndMortyViewModel.swift
//  RickyAndMortyProject
//
//  Created by Robson Novato Lobao on 22/07/21.
//

import Foundation

protocol UsersDelegate {
    func getDataSucess()
    func getDataFail(error: Error)
    func showLoad()
    func removeLoad()
}

class UsersViewModel  {
    
    var service: UsersService?
    var users: [Datum] = []
    var delegate: UsersDelegate?
    
    init(_ service: UsersService? = UsersService(), delegate: UsersDelegate? = nil) {
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
