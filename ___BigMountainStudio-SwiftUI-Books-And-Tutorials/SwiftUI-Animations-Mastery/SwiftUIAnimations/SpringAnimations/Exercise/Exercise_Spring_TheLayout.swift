//
//  Exercise_Spring_TheLayout.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/7/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_Spring_TheLayout: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [Color("DarkAccent2"), Color("DarkShade2")]),
                           startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Image("Planet")
                    .padding(.vertical, 80)
                
                Text("PLANET EXPLORER")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color("LightShade2"))
                
                VStack {
                    Text("START")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                    
                    Text("EXPLORING!")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                }
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .accentColor(Color("LightShade2"))
                        .padding(25)
                        .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                }
            }
        }
    }
}

struct Exercise_Spring_TheLayout_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Spring_TheLayout()
    }
}
