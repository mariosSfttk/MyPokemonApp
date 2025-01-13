//
//  InitModel.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation

//General
struct PokemonData: Codable {
    let next : String?
    let previous : String?
    var results: [Results]
}

struct Results: Codable {
    var name: String
    var url: String
}

//By type
struct PokemonType: Codable {
    let name: String
    let pokemon: [Pokemon]
}

struct Pokemon: Codable {
    let pokemon: Pokemon
    
    struct Pokemon: Codable {
        let name: String
        let url: String
    }
}

