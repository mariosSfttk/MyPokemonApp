//
//  RegisterViewModel.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation


class RegisterViewModel {
    
    
    func registerUserWasSuccess(name: String, pass: String) -> Bool {
        let userObject = User(name: name, pass: pass)
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(userObject)
            UserDefaults.standard.setValue(data, forKey: Strings.General.userInfo)
            Loader.sharedInstance.hideIndicator()
            return true
        } catch {
            print(Strings.General.wrongMessage)
            return false
        }
    }
}
