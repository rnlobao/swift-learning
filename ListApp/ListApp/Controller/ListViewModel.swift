//
//  ListViewModel.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 27/07/21.
//

import Foundation
import UIKit

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
    var myColor: UIColor = UIColor.red
    
    init(_ service: ListService? = ListService(), delegate: ServiceDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }
    
    func backgroundColor() {
        let userDefault = UserDefaults.standard
        let color = userDefault.string(forKey: "color")
        if color == "red" {
            myColor = UIColor.red
            delegate?.dataSucess()
            return
        }
        myColor = UIColor.green
        delegate?.dataSucess()
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
