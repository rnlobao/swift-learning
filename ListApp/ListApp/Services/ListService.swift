//
//  ListService.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 27/07/21.
//

import Foundation

import Alamofire

class ListService {
    private var alamoFireManager: Session? = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        let alamoFireManager = Alamofire.Session(configuration: configuration)
        return alamoFireManager
    }() //definir certas configuracoes, privado dentro do codigo
    
    func getUsers(sucess: @escaping ([Users])-> Void,error: @escaping (Error)-> Void) {
        request(url: "https://reqres.in/api/users?page=2", method: .get, obj: ListResult.self) { result in
            sucess(result.data ?? [])
        } error: { e in
            error(e)
        }
    }
    
    
    func postUsers(name: String, job: String, sucess: @escaping ([Users])-> Void,error: @escaping (Error)-> Void) {
        let parameters: [String:Any] = [
            "name": name,
            "job": job,
        ]
        request(url: "https://reqres.in/api/users", method: .post, params: parameters, obj: ListResult.self) { result in
            sucess(result.data ?? [])
        } error: { e in
            error(e)
        }
    }
    
    func request<T: Codable>(url: String,method: HTTPMethod , params: [String:Any]? = nil, obj: T.Type, sucess: @escaping (T)-> Void, error: @escaping (Error)-> Void) {
        alamoFireManager?.request(url, method: method, parameters: params).responseJSON { response in
            switch response.result {
            case .success: //200 ok //404 not found //500 erro interno
                do {
                    let resultObj = try JSONDecoder().decode(obj.self, from: response.data ?? Data())
                    sucess(resultObj)
                } catch let decodeErr {
                    error(decodeErr)
                }
                return
            case .failure:
                error(response.error!)
                return
            }
        }
        
        
        

    } //repare no t.type, ele pode ser de qualquer tipo MESMO, mas so vai chamar caso de sucesso
 
}
