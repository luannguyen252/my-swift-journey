//
//  BasicAnimations_CheckUnderstanding1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BasicAnimations_CheckUnderstanding1: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
            
            RoundedRectangle(cornerRadius: 10)
//                .offset(x: change ? 50 : 0, y: change ? 50 : 0)
//                .frame(width: change ? 100 : 400, height: change ? 50 : 200)
                .scaleEffect(change ? 0.5 : 1)  // Correct
                // Insert code here
                .animation(.default)

            RoundedRectangle(cornerRadius: 10)
            
            Button("Change") {
                self.change.toggle()
            }
        }.foregroundColor(.blue)
    }
}

struct BasicAnimations_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_CheckUnderstanding1()
    }
}
