//
//  DetailViewModel.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation
import UIKit


class DetailViewModel {
    
    var refreshData = { () -> () in }
    var pokemonDetailInfo: PokemonDetailInfo? = nil {
        didSet {
            refreshData()
        }
    }
    
    
    func noDataText() -> String {
        return Strings.General.noData
    }
    func getPokemonName() -> String {
        if let pokemonData = pokemonDetailInfo {
            return pokemonData.name.capitalized
        }
        return noDataText()
    }
    
    func getPokemonNumber() -> String {
        if let pokemonData = pokemonDetailInfo {
            return String(format: "%d", pokemonData.id)
        }
        return noDataText()
    }
    
    func getStats() -> String {
        var allStats = ""
        if let pokemonData = pokemonDetailInfo {
            for singleStat in pokemonData.stats {
                allStats += singleStat.stat.name + ": \t" + String(format: "%d",singleStat.base_stat) + "\n"
            }
            return allStats
        }
        return noDataText()
    }
    
    
    func getPokemonInfo(pokemon: String) {
        let byNameKey = "/pokemon/"
        let url = String(format: "%@%@%@", BASE_API_URL, byNameKey, pokemon.lowercased())
        invokeService(url, andOperation: OPERATION_BY_NAME_QUERY)
    }
    
    func getPokemonType() -> String {
        if let pokemonData = pokemonDetailInfo, let first = pokemonData.types.first {
            let type = first.type.url.suffix(3)
            return type.replacingOccurrences(of: "/", with: "")
        }
        return noDataText()
    }
    
    func getBtnColor() -> UIColor {
        print(getPokemonType())
        return UIColor(named: getPokemonType())!
    }
    
    func invokeService(_ withUrl: String, andOperation: Int) {
        Server.shared.simpleService(fromUrlString: withUrl, operationCode: andOperation) { [weak self] (operationCode, result) in
            switch operationCode {
            case OPERATION_BY_NAME_QUERY:
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(PokemonDetailInfo.self, from: data)
                        self!.pokemonDetailInfo = response
                        break
                    } catch {
                        print("JSON error: \(error.localizedDescription)")
                    }
                }
                break
            default:
                break
            }
        }
    }
}
