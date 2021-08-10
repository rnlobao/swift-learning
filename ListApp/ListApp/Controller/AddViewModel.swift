//
//  AddViewModel.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 30/07/21.
//

import Foundation
import UIKit

class AddViewModel {
    var service: ListService?
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
            return
        }
        myColor = UIColor.green
    }
    
    func postData(name: String, job: String) {
        delegate?.showLoad()
        service?.postUsers(name: name, job: job, sucess: { result in
            self.delegate?.dataSucess()
            self.delegate?.removeLoad()
        }, error: { error in
            self.delegate?.dataFail(error: error)
            self.delegate?.removeLoad()
        })
    }
    
    
}


