//
//  Shadow_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Shadow").font(.largeTitle)
                Text("On Different Views").foregroundColor(.gray)
                Text("Shadows will form around the opaque (solid) parts of the view.")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color.blue)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Group {
                    Text("Shadow on Text")
                        .font(.custom("Gill Sans", size: 50))
                    
                    Circle()
                        .foregroundColor(.blue)
                        .overlay(Text("On Shapes").foregroundColor(.white))
                        .frame(height: 200)
                    
                    Button(action: {}) {
                        Text("Shadow on Button")
                    }
                    .padding()
                    .background(Capsule())
                    
                    Image("valley")
                    
                    Image(systemName: "paintbrush.fill")
                        .padding()
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    
                }
                .shadow(color: .black, radius: 10) // Adding to Group will apply the shadow individually to each of the children inside
                
            }.font(.title)
        }
    }
}

struct Shadow_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_Intro()
    }
}
