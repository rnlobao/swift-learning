//
//  UsersResult.swift
//  Parte3
//
//  Created by Robson Novato Lobao on 22/07/21.
//

import Foundation

// MARK: - CharacterResult
struct UsersResult: Codable {
    let page, perPage, total, totalPages: Int?
    let data: [Datum]?
    let support: Support?
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let email, first_name, lastName: String?
    let avatar: String?
}

// MARK: - Support
struct Support: Codable {
    let url: String?
    let text: String?
}
