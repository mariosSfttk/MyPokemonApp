//
//  AppDelegate.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let view = LoginView()
        let navigation = UINavigationController(rootViewController: view)
        navigation.isNavigationBarHidden = true
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }


}

