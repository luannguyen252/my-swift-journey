//
//  Spring_Options_Repeating.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_Options_Repeating: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Spring Options")
                    .foregroundColor(Color("Gold"))
                SubtitleText("Repeat")
                BannerText("Here are different options for repeating spring animations.",
                           backColor: Color("Gold"))
                
                Button("Start") {
                    self.change.toggle()
                }
                .foregroundColor(Color("Accent"))
                
                Group {
                    Text("Using dampingFraction = 0")
                    Text("(spring animation)").font(.body).foregroundColor(.white)
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 20 : -20)
                        .animation(Animation.spring(response: 1, dampingFraction: 0))
                    Text("Using dampingFraction = 0")
                    Text("(interpolatingSpring animation").font(.body).foregroundColor(.white)
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 20 : -20)
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 0))
                    Text("Repeat 3 times")
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 40 : -40)
                        .animation(Animation.spring(response: 0.5, dampingFraction: 0.5)
                            .repeatCount(3, autoreverses: false))
                    Text("Repeat Forever")
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 40 : -40)
                        .animation(Animation.spring(response: 0.5, dampingFraction: 0.5)
                            .repeatForever(autoreverses: false))
                }
            }
            .font(.title)
            .foregroundColor(Color("Gold"))
        }
    }
}

struct Spring_Options_Repeating_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Options_Repeating()
    }
}
