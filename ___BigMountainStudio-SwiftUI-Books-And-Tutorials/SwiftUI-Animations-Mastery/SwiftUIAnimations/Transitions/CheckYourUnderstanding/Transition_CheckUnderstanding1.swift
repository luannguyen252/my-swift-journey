//
//  Transition_CheckUnderstanding1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_CheckUnderstanding1: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Change") {
                self.change.toggle()
            }
            
            if change {
                Text("Hello!")
                    .transition(.move(edge: .bottom))
            }
            
            Spacer()
        }
    }
}

struct Transition_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        Transition_CheckUnderstanding1()
    }
}
