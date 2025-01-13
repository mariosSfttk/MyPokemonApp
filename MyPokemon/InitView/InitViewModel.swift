//
//  InitViewModel.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation


class InitViewModel {
    var refreshData = { () -> () in }
    var pokemonData: [Results] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getInitData() {
        let offset = String(format:"&offset=0")
        let limit = String(format: "pokemon?limit=20")
        let url = String(format: "%@%@%@", BASE_API_URL, limit, offset)
        invokeService(url, andOperation: OPERATION_INIT_QUERY)
    }
    
    func getDataByName(toSearch: String) {
        let byNameKey = "/pokemon/"
        let url = String(format: "%@%@%@", BASE_API_URL, byNameKey, toSearch.lowercased())
        invokeService(url, andOperation: OPERATION_BY_NAME_QUERY)
    }
    
    func getDataByType(toSearch: String) {
        let byTypeKey = "type/"
        let url = String(format: "%@%@%@", BASE_API_URL, byTypeKey, toSearch.lowercased())
        invokeService(url, andOperation: OPERATION_BY_TYPE_QUERY)
    }
    
    func invokeService(_ withUrl: String, andOperation: Int) {
        Server.shared.simpleService(fromUrlString: withUrl, operationCode: andOperation) { [weak self] (operationCode, result) in
            self!.pokemonData = []
            switch operationCode {
            case OPERATION_INIT_QUERY:
                switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(PokemonData.self,from: data)
                        self!.pokemonData = response.results
                    } catch {
                        print("JSON error: \(error.localizedDescription)")
                    }
                    break
                case .failure(let error):
                    print("failure: \(error.localizedDescription)")
                    break
                }
                break
            case OPERATION_BY_NAME_QUERY:
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(PokemonDetailInfo.self, from: data)
                        let forms = response.forms[0]
                        let formInfo = Results(name: forms.name, url: forms.url)
                        self!.pokemonData = [formInfo]
                        break
                    } catch {
                        print("JSON error: \(error.localizedDescription)")
                    }
                }
                break
            case OPERATION_BY_TYPE_QUERY:
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(PokemonType.self, from: data)
                        let allPokemons = response.pokemon
                        for pokemon in allPokemons {
                            let formInfo = Results(name: pokemon.pokemon.name, url: pokemon.pokemon.url)
                            self!.pokemonData.append(formInfo)
                        }
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
    
    func getNumberOfRows() -> Int {
        return pokemonData.count
    }
    
    func getInfo(_ forIndex: Int) -> Results {
        return pokemonData[forIndex]
    }
}
