//
//  Spring_Dampen.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_Dampen: View {
    @State private var show = false
    @State private var dampingFraction = 0.825 // This is the default damping fraction
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Spring").foregroundColor(Color("Gold"))
                SubtitleText("Dampen")
                BannerText("Spring animations have a dampen property that dampens or make your spring less strong or intense.", backColor: Color("Gold"))
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay(Image("Phone"))
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(dampingFraction: self.dampingFraction)) // Adjust the "springiness"
                
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundColor(Color("Gold"))
                        .font(.largeTitle)
                }).accentColor(Color("Accent"))
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $dampingFraction)
                    Image(systemName: "1.circle.fill")
                }.foregroundColor(Color("Gold")).padding()
            }.font(.title)
        }
    }
}

struct Spring_Dampen_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Dampen()
    }
}
