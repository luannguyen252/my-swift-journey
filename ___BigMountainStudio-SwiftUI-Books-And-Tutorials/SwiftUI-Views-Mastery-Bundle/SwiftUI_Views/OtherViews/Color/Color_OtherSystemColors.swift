//
//  Color_MoreSystemColors.swift
//  100Views
//
//  Created by Mark Moeykens on 7/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_OtherSystemColors : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color").font(.largeTitle)
            Text("Other System Colors")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("These colors show differently depending on Light or Dark mode.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .font(.title)
            
            Text("Light Mode").font(.title)
            Text("Primary Color")
                .foregroundColor(Color.primary)
            Text("Secondary Color")
                .foregroundColor(Color.secondary)
            Text("Accent Color")
                .foregroundColor(Color.accentColor)
            
            Group {
                Text("Dark Mode").font(.title)
                Text("Primary Color")
                    .foregroundColor(Color.primary)
                Text("Secondary Color")
                    .foregroundColor(Color.secondary)
                Text("Accent Color")
                    .foregroundColor(Color.accentColor)
            }
        }
    }
}

struct Color_OtherSystemColors_Previews : PreviewProvider {
    static var previews: some View {
        Color_OtherSystemColors()
    }
}
