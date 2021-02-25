//
//  Triggers_CheckYourUnderstanding2.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Triggers_CheckYourUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animate the Circle")
            
            Circle()
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
                .animation(.default)
            
            Button("Change") {
                self.change = false
            }
        }.font(.title)
    }
}

struct Triggers_CheckYourUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        Triggers_CheckYourUnderstanding2()
    }
}
