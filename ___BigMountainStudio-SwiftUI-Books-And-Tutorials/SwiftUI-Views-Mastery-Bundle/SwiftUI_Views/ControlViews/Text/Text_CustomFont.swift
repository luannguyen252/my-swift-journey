//
//  Text_CustomFont.swift
//  100Views
//
//  Created by Mark Moeykens on 8/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_CustomFont: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("Text",
                       subtitle: "Custom Fonts",
                       desc: "Use a font that already exists on the system. If the font name doesn't exist, it goes back to the default font.", back: .green, textColor: .white)
            
            Text("This font doesn't exist")
                .font(Font.custom("No Such Font", size: 26))
            
            DescView(desc: "Existing fonts:", back: .green, textColor: .white)
            
            Text("Avenir Next")
                .font(Font.custom("Avenir Next", size: 26))
            
            Text("Gill Sans")
                .font(Font.custom("Gill Sans", size: 26))
            
            Text("Helvetica Neue")
                .font(Font.custom("Helvetica Neue", size: 26))
            
            DescView(desc: "Adjust the weight:", back: .green, textColor: .white)
            
            Text("Avenir Next Regular")
                .font(Font.custom("Avenir Next Bold", size: 26))
            
            Text("Or change with the weight modifier:")
                .foregroundColor(.red)
            
            Text("Avenir Next Bold Weight")
                .font(Font.custom("Avenir Next", size: 26).weight(.bold))
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Text_CustomFont_Previews: PreviewProvider {
    static var previews: some View {
        Text_CustomFont()
    }
}
