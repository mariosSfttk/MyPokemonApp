//
//  LoginViewModel.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation


class LoginViewModel {
    
    
    func validateUser(loginUser: LoginUser) -> Bool{
        if let user = getPersistData(), user.name == loginUser.name, user.pass == loginUser.password {
            return true
        }
        return false
    }
    
    func getPersistData() -> User? {
        if let data = UserDefaults.standard.data(forKey: Strings.General.userInfo) {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                return user
            } catch {
                print(Strings.General.wrongMessage)
            }
        }
        return nil
    }
}
