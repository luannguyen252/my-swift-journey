//
//  Shadow_CreatingRaisedEffect.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_CreatingRaisedEffect: View {
    var body: some View {
        ZStack {
            // Background Color
            Color("Theme1Background")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Shadow").font(.largeTitle)
                Text("Raised Effect").foregroundColor(.gray)
                Text("You can use shadows to give the illusion that a view is raised up. This works best with a non-white background.")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color("Theme1Foreground"))
                    .foregroundColor(Color("Theme1Background"))
                
                Spacer()
                
                HStack {
                    Image("profile.woman")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle()).padding()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Anna Petrova").bold()
                        Text("Moscow").font(.caption)
                    }
                    Spacer()
                }
                .foregroundColor(Color("Theme1Foreground"))
                .frame(width: 350, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color("Theme1Background"))
                        .shadow(color: Color("Theme1Highlight"), radius: 4, x: -4, y: -4)
                        .shadow(radius: 4, x: 4, y: 4))
                
                Spacer()
                
                Text("Raised Buttons")
                HStack(spacing: 60) {
                    Button(action: {}) {
                        Image(systemName: "lightbulb")
                    }
                    .frame(width: 80, height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color("Theme1Background"))
                            // Note: The shadow goes on the background, not the button.
                            .shadow(color: Color("Theme1Highlight"), radius: 3, x: -4, y: -4)
                            .shadow(radius: 3, x: 4, y: 4))
                    
                    Button(action: {}) {
                        Image(systemName: "lightbulb")
                    }
                    .frame(width: 96, height: 96)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color("Theme1Background"), lineWidth: 4)
                            .shadow(color: Color("Theme1Highlight"), radius: 3, x: 4, y: 4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color("Theme1Background"), lineWidth: 4)
                            .shadow(radius: 3, x: -4, y: -4))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                
                Spacer()
            }
            .accentColor(Color("Theme1Accent"))
            .font(.title)
        }
        .minimumScaleFactor(0.5)
    }
}

struct Shadow_CreatingRaisedEffect_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_CreatingRaisedEffect()
    }
}
