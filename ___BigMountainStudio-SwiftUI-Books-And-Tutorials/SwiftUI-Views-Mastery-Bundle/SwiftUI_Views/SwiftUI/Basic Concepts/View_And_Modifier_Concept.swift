//
//  View_And_Modifier_Concept.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct View_And_Modifier_Concept: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Views & Modifiers").font(.largeTitle)
            Text("Concepts").foregroundColor(.gray)
            Text("Building a UI with SwiftUI consists of using Views and Modifiers. Traditional methods used controls and properties. With SwiftUI, you add a view and then set properties with modifiers.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .layoutPriority(1)
            
            Button(action: {}) {
                Text("Button With Shadow")
                    .padding(12)
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(8)
            }.shadow(color: Color.gray, radius: 5, y: 5)
            
        }.font(.title)
    }
}

struct View_And_Modifier_Concept_Previews: PreviewProvider {
    static var previews: some View {
        View_And_Modifier_Concept()
    }
}
