//
//  Color_1_00_Background.swift
//  100Views
//
//  Created by Mark Moeykens on 6/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_AsBackground : View {
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .ignoresSafeArea()
            
            // Your main view content here
            VStack(spacing: 20) {
                HeaderView("Color",
                           subtitle: "Using As Background",
                           desc: "With a ZStack, you can set a Color view as the background color.", back: .orange)
                    .font(.title)
                
                Text("(Background in Dark Mode)")
                    .padding(.top, 150)
            }
        }
    }
}

struct Color_AsBackground_Previews : PreviewProvider {
    static var previews: some View {
        Color_AsBackground()
    }
}
