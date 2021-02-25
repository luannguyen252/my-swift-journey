//
//  BasicAnimations_CheckUnderstanding2.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BasicAnimations_CheckUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
            
            Text("Hello!")
                .animation(.default)
                .font(.system(size: change ? 160 : 40))
            //                    .font(.system(size: 40))
            //                    .scaleEffect(change ? 4 : 1)
            //                    .font(.system(size: 160)) // Correct
            //                    .scaleEffect(change ? 1 : 0.25) // Correct
            // Insert code here
            
            RoundedRectangle(cornerRadius: 10)
            
            Button("Change") {
                self.change.toggle()
            }
        }.foregroundColor(.blue)
    }
}

struct BasicAnimations_CheckUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_CheckUnderstanding2()
    }
}
