//
//  ImageHelper.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation
import UIKit


func getImage(forUrl: String, completion: @escaping(_ myImage: UIImage) -> Void) {
    DispatchQueue.global(qos: .background).async {        
        let imgUrl = URL( string: forUrl)
        let imageData = NSData(contentsOf: imgUrl! as URL)
        
        DispatchQueue.main.async {
            
            if let imgData = imageData as? Data {
                let auxImg = UIImage.init(data: imgData)
                completion(auxImg!)
            }
        }
    }
}
