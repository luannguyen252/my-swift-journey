//
//  StatView.swift
//  UI
//
//  Created by josh on 2019/08/28.
//  Copyright © 2019 josh. All rights reserved.
//

import SwiftUI
import Model

struct StatView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading) {
            Text("Stats").font(.title)
            pokemon.weight.map { Text("Weight: \($0)") }
            pokemon.height.map { Text("Height: \($0)") }
            pokemon.baseExperience.map { Text("Base Experience: \($0)") }
            pokemon.abilities.map(AbilitiesView.init)
            pokemon.forms.map(FormsView.init)
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
