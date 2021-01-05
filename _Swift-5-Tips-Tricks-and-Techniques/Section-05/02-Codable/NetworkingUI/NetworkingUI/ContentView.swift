//
//  ContentView.swift
//  NetworkingUI
//
//  Created by Philipp Baldauf on 20.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    private let url = URL(string: "https://swapi.co/api/people/")!
    
    @ObservedObject var model = CharacterModel()
    
    init() {
        refresh()
    }
    
    var body: some View {
        List(model.characters) { character in
            Text(character.name)
        }
    }
    
    private func refresh() {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let people = try? JSONDecoder().decode(People.self, from: data)
                if let people = people {
                    DispatchQueue.main.async {
                        self.model.characters = people.results
                    }
                }
            } else {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Could not load data")
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
