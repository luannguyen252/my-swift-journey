//
//  Interpolating_InitialVelocity.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interpolating_InitialVelocity: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Interpolating Spring").foregroundColor(Color("Gold"))
                SubtitleText("Initial Velocity")
                BannerText("Initial velocity is how fast the start of the animation is.", backColor: Color("Gold"))
                
                Button("Compare Initial Velocity") {
                    self.change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("0").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 1, stiffness: 50,
                                                            damping: 7,
                                                            initialVelocity: 0)) // Default
                    }
                    VStack {
                        Text("5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 1, stiffness: 50,
                                                            damping: 7, initialVelocity: 5))
                    }
                    VStack {
                        Text("10").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 1, stiffness: 50,
                                                            damping: 7, initialVelocity: 10))
                    }
                    VStack {
                        Text("50").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 1, stiffness: 50,
                                                            damping: 7, initialVelocity: 50))
                    }
                    VStack {
                        Text("100").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(mass: 1, stiffness: 50,
                                                                     damping: 7, initialVelocity: 100))
                    }
                }
                .font(.system(size: 25))
                .foregroundColor(.white)
                
            }.font(.title)
        }
    }
}

struct Interpolating_InitialVelocity_Previews: PreviewProvider {
    static var previews: some View {
        Interpolating_InitialVelocity()
    }
}
