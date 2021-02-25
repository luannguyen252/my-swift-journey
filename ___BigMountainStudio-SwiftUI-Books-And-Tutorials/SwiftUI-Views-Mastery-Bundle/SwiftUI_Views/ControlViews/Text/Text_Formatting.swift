//
//  Text_Modifiers.swift
//  100Views
//
//  Created by Mark Moeykens on 6/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_Modifiers : View {
    @State private var modifierActive = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Text").font(.largeTitle)
            Text("Formatting")
                .font(.title)
                .foregroundColor(.gray)
            Text("More modifiers for Text. Some have a parameter that can listen to a @State var to know if they should be active or not.")
                .frame(maxWidth: .infinity, minHeight: 140)
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .font(.title)
                .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
            
            VStack(alignment: .leading) {
                HStack {
                    Image("Bold")
                    Text("Bold").bold()
                }
                HStack {
                    Image("Italic")
                    Text("Italic").italic()
                }
                HStack {
                    Image("Strikethrough")
                    Text("Strikethrough").strikethrough()
                }
                HStack {
                    Image("Strikethrough")
                    Text("Green Strikethrough")
                        .strikethrough(modifierActive, color: .green)
                }
                HStack {
                    Image("ForegroundColor")
                    Text("Text Color (ForegroundColor)").foregroundColor(.green)
                }
                HStack {
                    Image("Underline")
                    Text("Underline").underline()
                }
                HStack {
                    Image("Underline")
                    Text("Green Underline").underline(modifierActive, color: .green)
                }
            }.layoutPriority(1)
            
            Toggle("Modifiers Active", isOn: $modifierActive)
                .padding(.horizontal)
        }
    }
}

struct Text_Modifiers_Previews : PreviewProvider {
    static var previews: some View {
        Text_Modifiers()
    }
}
