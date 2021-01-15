//
//  DetailView.swift
//  UI
//
//  Created by josh on 2019/08/21.
//  Copyright © 2019 josh. All rights reserved.
//

import Model
import SwiftUI
import URLImage

struct DetailView: View {
    @ObservedObject var resource: Resource<Pokemon>

    var pokemon: Pokemon? { resource.result?.value }

    init(pokemon: Pokemon) {
        let endpoint = pokemonEndpoint(pokemon: pokemon)
        self.resource = Resource<Pokemon>(endpoint: endpoint)
    }

    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading) {
                    Text(pokemon?.name.capitalized ?? "-").font(.largeTitle)
                    pokemon?.sprites?.frontDefault.map(SquareImageView.init)
                    pokemon.map(StatView.init)
                }.padding(EdgeInsets(top: 140, leading: 16, bottom: 0, trailing: 16))
                HStack { Spacer() } // Hack to fix scroll view width
            }
        }
        .onAppear { self.resource.load() }
        .onDisappear { self.resource.cancel() }
    }
}
