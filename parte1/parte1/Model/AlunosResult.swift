//
//  AlunosResult.swift
//  Parte1
//
//  Created by Robson Novato Lobao on 15/07/21.
//

import Foundation


struct AlunosResult: Codable {
    let results: [Alunos]?
}

struct Alunos: Codable {
    let nome: String?
    let idade: String?
    
}

struct Location: Codable {
    let nome: String?
    let idade: String?
}
