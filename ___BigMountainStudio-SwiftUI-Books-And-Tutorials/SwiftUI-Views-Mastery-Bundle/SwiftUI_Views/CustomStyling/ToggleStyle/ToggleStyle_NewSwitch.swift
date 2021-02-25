//
//  ToggleStyle_NewSwitch.swift
//  100Views
//
//  Created by Mark Moeykens on 9/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ToggleStyle_NewSwitch: View {
    @State private var toggleState = false
    @State private var toggleState2 = true
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Toggle Style").font(.largeTitle)
            Text("Toggle Reconstruction").font(.title).foregroundColor(.gray)
            Text("You can also reconstruct the Toggle so it has more customization options than the normal toggle. This is my attempt to reproduce the system Toggle view.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Toggle("My Colored Toggle", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(onColor: .green,
                                       offColor: .red,
                                       thumbColor: Color(UIColor.systemTeal)))
            
            Toggle("Custom Toggle", isOn: $toggleState2)
                .toggleStyle(ColoredToggleStyle(onColor: .purple)) // Your new toggle style
            
            Toggle(isOn: $toggleState) {
                Text("Regular Toggle")
            }
            .font(.title)
            .padding(.horizontal)
        }
    }
}

struct ColoredToggleStyle: ToggleStyle {
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label // The text (or view) portion of the Toggle
            Spacer()
            RoundedRectangle(cornerRadius: 16, style: .circular)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 50, height: 29)
                .overlay(
                    Circle()
                        .fill(thumbColor)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1.5)
                        .offset(x: configuration.isOn ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.2))
                .onTapGesture { configuration.isOn.toggle() }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct ToggleStyle_NewSwitch_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStyle_NewSwitch()
    }
}
