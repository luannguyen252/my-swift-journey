//
//  ToggleStyle_CustomStyle.swift
//  100Views
//
//  Created by Mark Moeykens on 9/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ToggleStyle_CustomStyle: View {
    @State private var toggleState = true
    var body: some View {
        VStack(spacing: 20) {
            Text("Toggle Style").font(.largeTitle)
            Text("Customization").font(.title).foregroundColor(.gray)
            Text("Creating a custom toggle style is different than customizing a button. You actually have to create and return something to use as a toggle.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Toggle("", isOn: $toggleState)
                .toggleStyle(PurpleTextToggleStyle(label: "Purple Toggle"))
            
            Text("The best you can do customize everything but the actual Toggle.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
        }
    }
}

struct PurpleTextToggleStyle: ToggleStyle {
    var label = ""
    func makeBody(configuration: Self.Configuration) -> some View {
        // If you are using a Toggle, you cannot customize colors
        // as of SwiftUI 1.0.
        Toggle(isOn: configuration.$isOn) {
            Text(label)
                .foregroundColor(.purple)
                .fontWeight(.light)
                .font(.title)
        }.padding(.horizontal)
    }
}

struct ToggleStyle_CustomStyle_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStyle_CustomStyle()
    }
}
