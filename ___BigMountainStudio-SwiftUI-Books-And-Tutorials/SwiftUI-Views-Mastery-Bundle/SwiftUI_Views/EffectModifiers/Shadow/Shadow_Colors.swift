//
//  Shadow_Colors.swift
//  100Views
//
//  Created by Mark Moeykens on 9/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_Colors: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Shadow").font(.largeTitle)
                Text("Colors").font(.title).foregroundColor(.gray)
                Text("Shadows are black with 33% opacity. You can change the color with another parameter.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                
                Group {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .frame(width: 300, height: 75)
                        .shadow(color: .purple, radius: 10)
                        .overlay(Text("Color: Purple"))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .frame(width: 300, height: 75)
                        .shadow(color: .red, radius: 10)
                        .overlay(Text("Color: Red"))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .frame(width: 300, height: 75)
                        .shadow(color: .gray, radius: 10)
                        .overlay(Text("Color: Gray"))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .frame(width: 300, height: 75)
                        .shadow(color: .black, radius: 10)
                        .overlay(Text("Color: Black"))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .frame(width: 300, height: 75)
                        .shadow(color: .primary, radius: 10)
                        .overlay(Text("Color: Primary"))
                }
                .font(.title)
                .foregroundColor(.white)
            }
        }
    }
}

struct Shadow_Colors_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_Colors()
    }
}
