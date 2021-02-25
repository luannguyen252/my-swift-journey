//
//  Color_ColorLiterals.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_ColorLiterals: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color").font(.largeTitle)
            Text("Using Color Literals").foregroundColor(.gray)
            Text("Color literals are an easy way to define custom colors right in your code and get a little preview of it. Here is how you create one:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .minimumScaleFactor(0.5)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("1. Type 'Color()' in your code.")
                Text("2. Inside the parentheses of 'Color()', start typing in 'Color Literal' until you see the autocomplete suggestion:")
                Image("ColorLiteral").shadow(radius: 8)
                Text("3. Hit ENTER to select it.")
                Text("4. Double-click on the color preview to select a preset color or click 'Customize...' to use the color tools.")
                Image("ColorLiteralSelected").shadow(radius: 8)
            }
            .font(.body)
            .padding(.horizontal)
        }.font(.title)
    }
}

struct Color_ColorLiterals_Previews: PreviewProvider {
    static var previews: some View {
        Color_ColorLiterals()
    }
}
