//
//  ContentView.swift
//  Pokemon
//
//  Created by josh on 2019/07/17.
//

import SwiftUI
import Model

public struct ListViewContainer: View {

    @ObservedObject var resource: Resource<PokemonPage>

    public var body: some View {
        NavigationView {
            view(for: resource)
        }
        .onAppear { self.resource.load() }
        .onDisappear { self.resource.cancel() }
    }

    public init(resource: Resource<PokemonPage>) {
        self.resource = resource
    }

    func view(for resource: Resource<PokemonPage>) -> some View {
        return Group {
            if resource.result == nil {
                LoadingView()
            } else {
                Group {
                    if resource.result?.value?.pokemons == nil {
                        ErrorView()
                    } else {
                        ListView(pokemons: resource.result?.value?.pokemons ?? [])
                        .navigationBarTitle("All Pokemon")
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ListViewContainer(resource: Resource(endpoint: pokemonPageEndpoint))
    }
}
#endif
