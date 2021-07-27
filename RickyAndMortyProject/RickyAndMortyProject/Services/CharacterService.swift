//
//  CharacterService.swift
//  RickyAndMortyProject
//
//  Created by Robson Novato Lobao on 06/07/21.
//


//esse arquivo seta o alamofire e faz o request na api do json (caso haja algo la)
import Foundation
import Alamofire

class CharacterService {
    
    private var alamoFireManager: Session? = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        let alamoFireManager = Alamofire.Session(configuration: configuration)
        return alamoFireManager
    }() //definir certas configuracoes, privado dentro do codigo
    
    func getCharacters(sucess: @escaping ([Character])-> Void,error: @escaping (Error)-> Void) {
        request(url: "https://rickandmortyapi.com/api/character", method: .get, obj: CharacterResult.self) { result in
            sucess(result.results ?? [])
        } error: { e in
            error(e)
        }
    } //@escaping serve quando o request der resposta podemos retornar, funciona como uma funcao
    //@escaping = return item so que espeerando a base de dados
    //aqui da base de dados eu vou buscar apenas os caracteres, chamando a funcao request
    
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
