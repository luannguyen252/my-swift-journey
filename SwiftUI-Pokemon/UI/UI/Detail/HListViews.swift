//
//  HListViews.swift
//  UI
//
//  Created by josh on 2019/08/28.
//  Copyright © 2019 josh. All rights reserved.
//

import SwiftUI
import Model

struct HListView: View {
    let strings: [String]
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.title)
            HStack {
                ForEach(strings) { str in
                    Circle()
                        .fill(Color.red)
                        .frame(width: 5, height: 5, alignment: .center)
                    Text(str.capitalized)
                }
            }
        }.padding(
            EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)
        )
    }
}

struct AbilitiesView: View {
    let abilities: [Ability]

    var body: some View {
        HListView(strings: abilities.map ({ $0.ability.name}), title: "Abilities")
    }
}

struct FormsView: View {
    let forms: [Species]

    var body: some View {
        HListView(strings: forms.map ({ $0.name }), title: "Forms")
    }
}

// HeldItemsView
// MovesView
// StatsView
// TypeElementsView
