//
//  Preview_LightAndDarkMode.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Preview_LightAndDarkMode: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews").font(.largeTitle)
            Text("Light & Dark Modes Together").foregroundColor(.gray)
            Text("Group your views to preview more than one at a time.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
            
        }.font(.title)
    }
}

struct Preview_LightAndDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        // Just use a Group container to instantiate your views in
        Group {
            Preview_LightAndDarkMode() // Light Mode
            Preview_LightAndDarkMode()
                .preferredColorScheme(.dark)
        }
    }
}
