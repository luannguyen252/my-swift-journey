//
//  ListView.swift
//  UI
//
//  Created by josh on 2019/07/31.
//  Copyright © 2019 josh. All rights reserved.
//

import SwiftUI
import Model


import Combine

public struct ListView: View {
    var pokemons: [Pokemon]

    public var body: some View {
        List(pokemons, id: \Pokemon.name) { pokemon in
            NavigationLink(destination: DetailView(pokemon: pokemon)) {
                HStack{
                    Image(systemName: "flame") // TODO: represents pokemon type
                    Text(pokemon.name.capitalized)
                }
            }
        }
    }
}
