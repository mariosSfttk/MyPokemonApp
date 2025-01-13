//
//  Strings.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation


struct Strings {
    struct LoginScreen {
        static var userPlaceHolder: String {
            return "Usuario"
        }
        static var passwordPlaceHolder: String {
            return "Contraseña"
        }
        static var btnLogin: String {
            return "Entrar"
        }
        static var notRegistered: String {
            return "¿No estás registrado?"
        }
        static var createAccount: String {
            return "Crea una cuenta"
        }
        static var alertError: String {
            return "Error"
        }
        static var emptyFields: String {
            return "Ingresa la información solicitada"
        }
        static var wrongInformation: String {
            return "Alguno de los datos no es correcto"
        }
    }
    
    struct RegisterScreen {
        static var titleHeader: String {
            return "Registro"
        }
        static var descriptionText: String {
            return "Para crear tu cuenta Pokemon te solicitamos que ingreses la información solicitada"
        }
        static var nameLabel: String {
            return "Nombre"
        }
        static var passLabel: String {
            return "Contraseña"
        }
        static var sendBtn: String {
            return "Enviar"
        }
        static var congrats: String {
            return "Felicidades"
        }
        static var successRegister: String {
            return "Tu registro ha sido exitoso"
        }
        
    }
    
    struct Icons {
        static var backArrow: String {
            return "chevron.backward"
        }
        static var personIcon: String {
            return "person"
        }
        static var loginLogo: String {
            return "pokeball"
        }
        static var magnifyingglassIcon: String {
            return "magnifyingglass"
        }
    }
    
    struct CustomAlert {
        static var cancel: String {
            return "Cancelar"
        }
        static var accept: String {
            return "Aceptar"
        }
        static var titleAlert: String {
            return "Title"
        }
        static var messageAlert: String {
            return "This is a message"
        }
    }
    
    struct General {
        static var wrongMessage: String {
            return "Something went wrong"
        }
        static var userInfo: String {
            return "userInfo"
        }
        static var noData: String {
            return "No_Data"
        }
    }
    
    struct InitScreen {
        static var optionName: String {
            return "Nombre"
        }
        static var optionType: String {
            return "Tipo"
        }
        static var searchByName: String {
            return "Buscar pokemon por nombre"
        }
        static var searchByType: String {
            return "Buscar pokemon por tipo"
        }
    }
    
    struct DetailScreen {
        static var stats: String {
            return "Stats"
        }
        static var btnType: String {
            return "Ver más del mismo tipo"
        }
    }
}
