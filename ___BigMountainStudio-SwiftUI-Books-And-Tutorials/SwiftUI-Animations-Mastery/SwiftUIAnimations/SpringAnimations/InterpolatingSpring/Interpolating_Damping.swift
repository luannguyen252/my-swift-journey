//
//  Interpolating_Damping.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interpolating_Damping: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Interpolating Spring").foregroundColor(Color("Gold"))
                SubtitleText("Damping")
                BannerText("Damping controls how much drag or friction is added to the spring.", backColor: Color("Gold"))
                
                Button("Compare Damping") {
                    self.change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("0").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 0))
                    }
                    VStack {
                        Text("0.5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 0.5))
                    }
                    VStack {
                        Text("1").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 1))
                    }
                    VStack {
                        Text("3").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 3))
                    }
                    VStack {
                        Text("5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 5))
                    }
                }
                .font(.system(size: 25))
                .foregroundColor(.white)
                
            }.font(.title)
        }
    }
}

struct Interpolating_Damping_Previews: PreviewProvider {
    static var previews: some View {
        Interpolating_Damping()
    }
}
