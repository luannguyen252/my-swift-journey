//
//  PreferredColorScheme_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct PreferredColorScheme_Intro: View {
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            Color("Theme4BackgroundColor")
            
            VStack(spacing: 20) {
                Text("Preferred Color Scheme")
                    .font(.largeTitle)
                    .foregroundColor(Color("Theme4ForegroundColor"))
                Text("Introduction")
                    .colorInvert()
                Text("No matter the color scheme the user is in, you can show a view in the light or dark color scheme.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color("Theme4BackgroundColor"))
                    .background(Color("Theme4ForegroundColor"))
                
                // Continued on next page
                
                // Continued from previous page
                
                VStack(spacing: 20) {
                    Text("Settings")
                        .font(.largeTitle)
                        .foregroundColor(Color("Theme4BackgroundColor"))
                    Toggle(isOn: $isOn) {
                        Text("Dark Mode")
                            .foregroundColor(Color("Theme4BackgroundColor"))
                    }
                }
                .padding(25)
                .background(RoundedRectangle(cornerRadius: 30)
                                .fill(Color("Theme4ForegroundColor")))
                .padding()
            }
            .font(.title)
        }
        .ignoresSafeArea()
        // Although on the parent view, it actually doesn't matter
        // where you put this modifier.
        .preferredColorScheme(isOn ? .dark : .light)
    }
}

struct PreferredColorScheme_Intro_Previews: PreviewProvider {
    static var previews: some View {
        PreferredColorScheme_Intro()
    }
}
