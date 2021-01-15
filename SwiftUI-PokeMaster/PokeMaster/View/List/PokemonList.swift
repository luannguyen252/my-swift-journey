//
//  PokemonList.swift
//  PokeMaster
//
//  Created by huhsx on 2020/7/30.
//  Copyright © 2020 huhsx. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    
    @State var expandingIndex: Int?
    @State var searchText: String = ""
    
    var body: some View {
        
        ScrollView {
            TextField("搜索", text: $searchText)
                .frame(height: 40)
                .padding(.horizontal, 25)
            ForEach(PokemonViewModel.all) { pokemon in
                PokemonInfoRow(model: pokemon, expanded: self.expandingIndex == pokemon.id)
                    .onTapGesture {
                        withAnimation(
                            .spring(response: 0.55, dampingFraction: 0.425, blendDuration: 0)
                        ){
                            self.expandingIndex = self.expandingIndex == pokemon.id ? nil : pokemon.id
                        }
                }
            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
