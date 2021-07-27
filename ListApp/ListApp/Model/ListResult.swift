//
//  ListResult.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 26/07/21.
//

import Foundation

// MARK: - CharacterResult
struct ListResult: Codable {
    let info: Info?
    let results: [Result]?
}

struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Characters: Codable {
    let id: Int?
    let name: String?
    let species: String?
    let image: String?
    let url: String?
}


