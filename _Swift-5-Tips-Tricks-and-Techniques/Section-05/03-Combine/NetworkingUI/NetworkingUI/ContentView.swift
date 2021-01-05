//
//  ContentView.swift
//  NetworkingUI
//
//  Created by Philipp Baldauf on 20.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation
import Combine
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
    
    private func refresh() {
        network.request(to: \.characters, on: model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
