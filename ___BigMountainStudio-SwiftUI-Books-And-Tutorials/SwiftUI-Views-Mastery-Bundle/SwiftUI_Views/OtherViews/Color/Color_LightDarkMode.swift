//
//  Color_LightDarkMode.swift
//  100Views
//
//  Created by Mark Moeykens on 7/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_LightDarkMode : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color").font(.largeTitle)
            Text("In Light and Dark Modes").font(.title).foregroundColor(.gray)
            Divider()
            Text("The system colors will actually change in light and dark mode to provide optimal contrast. If you supply a named color, you should try to adopt this practice.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
                .minimumScaleFactor(0.5)
                .font(.title)
            
            List {
                Color.pink
                Color.red
                Color.purple
                Color.blue
                Color.green
                Color.yellow
                Color.orange
                Text("Custom Colors")
                Color("AccentColorDark")
                Color("AccentColorLight")
            }
            
        }
    }
}

struct Color_LightDarkMode_Previews : PreviewProvider {
    static var previews: some View {
        Color_LightDarkMode()
    }
}
