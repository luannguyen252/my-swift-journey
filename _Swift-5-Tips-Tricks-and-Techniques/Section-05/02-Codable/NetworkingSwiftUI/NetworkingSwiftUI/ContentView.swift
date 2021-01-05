//
//  ContentView.swift
//  NetworkingSwiftUI
//
//  Created by Philipp Baldauf on 22.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = CharacterModel()
    
    init() {
        refresh()
    }
    
    var body: some View {
        List(model.characters) { character in
            Text(character.name)
        }
    }
    
    func refresh() {
        let url = URL(string: "https://swapi.co/api/people/")!
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data, let people = try? JSONDecoder().decode(People.self, from: data) {
                DispatchQueue.main.async {
                    self.model.characters = people.results
                }
            } else {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("No data received")
                }
            }
        }
        dataTask.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
