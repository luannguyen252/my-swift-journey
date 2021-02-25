//
//  Shadow_CreatingDepressedEffect.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_CreatingDepressedEffect: View {
    var body: some View {
        ZStack {
            // Background Color
            Color("Theme1Background")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Shadow").font(.largeTitle)
                Text("Depressed Effect").foregroundColor(.gray)
                Text("You can use shadows to give the illusion that a view is depressed as well. Again, this works best with a non-white background.")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color("Theme1Foreground"))
                    .foregroundColor(Color("Theme1Background"))
                
                Text("Depressed Buttons")
                HStack(spacing: 60) {
                    Button(action: {}) {
                        Image(systemName: "lightbulb.fill")
                    }
                    .frame(width: 80, height: 80)
                    .overlay(
                        Rectangle()
                            .stroke(Color("Theme1Background"), lineWidth: 4)
                            .shadow(radius: 3, x: 4, y: 4))
                    .overlay(
                        Rectangle()
                            .stroke(Color("Theme1Background"), lineWidth: 4)
                            .shadow(color: Color("Theme1Highlight"), radius: 3, x: -4, y: -4))
                    .clipped()
                    
                    Button(action: {}) {
                        Image(systemName: "lightbulb.fill")
                    }
                    .frame(width: 80, height: 80)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color("Theme1Background"), lineWidth: 4)
                            .shadow(radius: 3, x: 4, y: 4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color("Theme1Background"), lineWidth: 4)
                            .shadow(color: Color("Theme1Highlight"), radius: 3, x: -4, y: -4))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                
                Button(action: {}) {
                    Image(systemName: "lightbulb.fill")
                }
                .frame(width: 80, height: 80)
                .overlay(
                    Circle()
                        .stroke(Color("Theme1Background"), lineWidth: 4)
                        .shadow(radius: 3, x: 4, y: 4))
                .overlay(
                    Circle()
                        .stroke(Color("Theme1Background"), lineWidth: 4)
                        .shadow(color: Color("Theme1Highlight"), radius: 3, x: -4, y: -4))
                .clipShape(Circle())
                
                Spacer()
            }
            .accentColor(Color("Theme1Accent"))
            .font(.title)
        }
        .minimumScaleFactor(0.5)
    }
}

struct Shadow_CreatingDepressedEffect_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_CreatingDepressedEffect()
    }
}
