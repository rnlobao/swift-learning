//
//  ListService.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 27/07/21.
//

import Foundation
import Alamofire

class ListService {
    //ja setado
    private var alamoFireManager: Session? = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        let alamoFireManager = Alamofire.Session(configuration: configuration)
        return alamoFireManager
    }()
    
    
    
    func getCharacters(sucess: @escaping ([Character])-> Void,error: @escaping (Error)-> Void) {
        request(url: "https://rickandmortyapi.com/api/character", method: .get, obj: ListResult.self) { result in
            sucess(result.results ?? [])
        } error: { e in
            error(e)
        }
    }
    
    
    
    func request<T: Codable>(url: String,method: HTTPMethod , params: [String:Any]? = nil, obj: T.Type, sucess: @escaping (T)-> Void, error: @escaping (Error)-> Void) {
        alamoFireManager?.request(url, method: method, parameters: params).responseJSON { response in
            switch response.result {
            case .success:
                
            case .failure:
                
            }
        }
    }
}
