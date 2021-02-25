//
//  Refactoring.swift
//  100Views
//
//  Created by Mark Moeykens on 9/28/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Refactoring: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Refactoring")
                .font(.largeTitle)
            
            Text("Reusing Modifiers")
                .foregroundColor(.gray)
            
            Text("You can put common modifiers on the parent views to be applied to all the child views.")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue)
        }
        .font(.title) // This font style will be applied to ALL text views inside the VStack.
    }
}

struct Refactoring_Previews: PreviewProvider {
    static var previews: some View {
        Refactoring()
    }
}
