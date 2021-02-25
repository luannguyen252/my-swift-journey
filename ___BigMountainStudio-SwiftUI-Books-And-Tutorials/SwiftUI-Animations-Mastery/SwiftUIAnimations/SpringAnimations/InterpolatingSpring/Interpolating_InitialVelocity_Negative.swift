//
//  Interpolating_InitialVelocity_Negative.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/7/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interpolating_InitialVelocity_Negative: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                TitleText("Interpolating Spring").foregroundColor(Color("Gold"))
                SubtitleText("Negative Initial Velocity")
                BannerText("Providing a negative value for initial velocity can create a cool effect where the view 'backs up' before taking off.", backColor: Color("Gold"))
                
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Gold"))
                        .shadow(radius: 10)
                        .overlay(
                            VStack {
                                Text("Make Bigger!")
                                Image("woman.arms.up")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                            })
                        .aspectRatio(CGSize(width: 1, height: 1.5), contentMode: .fit)
                        .padding()
                        .scaleEffect(show ? 2 : 1, anchor: .leading)
                        .zIndex(1)
                        .animation(.interpolatingSpring(stiffness: 100,
                                                        damping: 10, initialVelocity: -10))
                        .onTapGesture { self.show.toggle() }

                    Text("Notice the rectangle gets smaller first before it gets bigger.")
                        
                }.foregroundColor(.white)
            }.font(.title)
        }
    }
}

struct Interpolating_InitialVelocity_Negative_Previews: PreviewProvider {
    static var previews: some View {
        Interpolating_InitialVelocity_Negative()
    }
}
