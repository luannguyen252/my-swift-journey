//
//  Interpolating_Mass.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interpolating_Mass: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Interpolating Spring").foregroundColor(Color("Gold"))
                SubtitleText("Mass")
                BannerText("Mass adds 'weight' to the view attached to the spring.", backColor: Color("Gold"))
                
                Button("Compare Mass") {
                    self.change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("0.01").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(mass: 0.01, stiffness: 50, damping: 7))
                    }
                    VStack {
                        Text("0.5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(mass: 0.5, stiffness: 50, damping: 7))
                    }
                    VStack {
                        Text("1").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(mass: 1, stiffness: 50, damping: 7))
                    }
                    VStack {
                        Text("10").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(mass: 10, stiffness: 50, damping: 7))
                    }
                    VStack {
                        Text("100").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(mass: 100, stiffness: 50, damping: 7))
                    }
                }
                .font(.system(size: 25))
                .foregroundColor(.white)
                
            }.font(.title)
        }
    }
}

struct Interpolating_Mass_Previews: PreviewProvider {
    static var previews: some View {
        Interpolating_Mass()
    }
}
