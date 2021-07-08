//
//  CharacterResult.swift
//  RickyAndMortyProject
//
//  Created by Robson Novato Lobao on 06/07/21.
//


//aqui a gente tem a struct criada a partir do json requisitado na API
import Foundation


struct CharacterResult: Codable {
    let info: Info?
    let results: [Character]?
}

struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

struct Character: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct Location: Codable {
    let name: String?
    let url: String?
}
