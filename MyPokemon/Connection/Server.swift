//
//  Server.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case unknownError
}


class Server {
    public static let shared = Server()
    
    func simpleService(fromUrlString: String, operationCode: Int, completion: @escaping(_ operationcode: Int, Result<Data, NetworkError>)-> Void) {
        guard let url = URL(string: fromUrlString) else {
            completion(operationCode, .failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil, let data = data {
                completion(operationCode, .success(data))
            } else {
                completion(operationCode, .failure(.unknownError))
            }
        }.resume()
    }
}
