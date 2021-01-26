//
//  Cocktail.swift
//  DateMe
//
//  Created by Tony Hajdini on 08/01/2020.
//  Copyright © 2020 Tony Hajdini. All rights reserved.
//

import Foundation
import SwiftUI

struct Photos: Codable, Identifiable {
    
    let id = UUID()
    var title: String
    var thumbnailUrl: String
}

class Api {
    func getPhotos(completion: @escaping ([Photos]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            fatalError("Someting's wrong with the URL")
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            let photos = try! JSONDecoder().decode([Photos].self, from: data!)
            
            DispatchQueue.main.async {
              completion(photos)
                print(photos)
            }
        }.resume()
        
        return
    }
}
