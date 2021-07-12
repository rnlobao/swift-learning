//
//  RickAndMortyViewModel.swift
//  RickyAndMortyProject
//
//  Created by Robson Novato Lobao on 06/07/21.
//

import Foundation

protocol RickAndMortyDelegate {
    func getDataSucess()
    func getDataFail(error: Error)
    func showLoad()
    func removeLoad()
}

class RickAndMortyViewModel  {
    
    var service: CharacterService?
    var characters: [Character] = []
    var delegate: RickAndMortyDelegate?
    
    init(_ service: CharacterService? = CharacterService(), delegate: RickAndMortyDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }
    
    
    func getData() {
        delegate?.showLoad()
        service?.getCharacters(sucess: { result in
            self.characters = result
            self.delegate?.getDataSucess()
            self.delegate?.removeLoad()
        }, error: { error in
            self.delegate?.getDataFail(error: error)
            self.delegate?.removeLoad()
        })
    }
    
}
