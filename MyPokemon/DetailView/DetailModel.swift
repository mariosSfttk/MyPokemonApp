//
//  DetailModel.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation

//By name
struct PokemonDetailInfo: Codable {
    let name: String
    let id: Int
    let sprites: Sprites
    let types: [Types]
    let stats: [Stats]
    var forms: [Forms]
}

struct Forms: Codable {
    let url: String
    let name: String
}

struct Sprites: Codable {
    let front_default: String
    let front_shiny: String
}

struct Stats: Codable {
    let effort: Int
    let base_stat: Int
    let stat: Stat
}

struct Stat: Codable {
    let name: String
    let url: String
}

struct Types: Codable {
    let type: Tipo
    
    struct Tipo: Codable {
        let name: String
        let url: String
    }
}

enum CodingKeys: String, CodingKey {
    case tipo = "Type"
}
