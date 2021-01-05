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
    
    private let network = RequestPeople()
    
    init() {
        refresh()
    }
    
    var body: some View {
        NavigationView {
            List(model.characters) { character in
                Text(character.name)
            }
            .navigationBarTitle("Characters")
            .navigationBarItems(trailing: Button("Refresh") {
                self.refresh()
            })
        }
    }
    
    func refresh() {
        model.characters.removeAll()
        network.requestAllPeople { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let characters):
                self.model.characters.append(contentsOf: characters)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
