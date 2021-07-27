//
//  ListViewModel.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 27/07/21.
//

import Foundation

class ListViewModel  {
    
    var service: ListService?
    var characters: [Characters] = []
    var delegate: ListDelegate?
    
    init(_ service: ListService? = ListService(), delegate: ListDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }
    
    
    func getData() {
        delegate?.showLoad()
        service?.getCharacters(sucess: { result in
           
            
        }, error: { error in
            
            
        })
    }
    
}
