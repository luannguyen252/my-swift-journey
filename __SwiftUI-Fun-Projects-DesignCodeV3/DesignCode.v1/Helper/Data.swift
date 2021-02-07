//
//  Data.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 11/2/20.
//

import SwiftUI

struct Post: Codable, Identifiable {
//    var id = UUID()
    var userId: Int
    var id: Int
    let title: String
    let body: String
}


class Api {
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    func getPosts(completion: @escaping([Post]) -> ()) {
        // declare URL
        guard let url = URL(string: urlString) else{return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else{ return }
            
            let decoder = JSONDecoder()
            let posts = try! decoder.decode([Post].self, from: data)
            
            // Interact with app while running API call as they are slower
            DispatchQueue.main.async {
                completion(posts)
            }
            
            //            print(posts)
        }
        .resume()
    }
}
