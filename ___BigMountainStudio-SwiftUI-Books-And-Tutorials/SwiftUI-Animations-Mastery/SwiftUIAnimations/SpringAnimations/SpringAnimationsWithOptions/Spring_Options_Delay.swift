//
//  Spring_Options_Delay.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_Options_Delay: View {
    @State private var show = false
    @State private var largeScale: CGFloat = 5
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                TitleText("Spring Options")
                    .foregroundColor(Color("Gold"))
                SubtitleText("Delay")
                BannerText("Use the delay to sequence spring animations.",
                           backColor: Color("Gold"))
                
                Button("Start") {
                    self.show.toggle()
                }
                .font(.title)
                .accentColor(Color("Accent"))
                
                Spacer()
                
                HStack(spacing: 30) {
                    Group {
                        Image(systemName: "1.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            //.animation(Animation.interpolatingSpring(stiffness: 50, damping: 4))
                            .animation(Animation.spring(response: 0.4, dampingFraction: 0.5))
                        
                        Image(systemName: "2.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            //.animation(Animation.interpolatingSpring(stiffness: 50, damping: 4))
                            .animation(Animation.spring(response: 0.4, dampingFraction: 0.5)
                                .delay(0.3)) // Delay for sequence
                        
                        Image(systemName: "3.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            //.animation(Animation.interpolatingSpring(stiffness: 50, damping: 4))
                            .animation(Animation.spring(response: 0.4, dampingFraction: 0.5)
                                .delay(0.6)) // Delay for sequence
                    }
                    .foregroundColor(Color("Gold"))
                    .font(.system(size: 100))
                }
                
                Spacer()
            }
        }
    }
}

struct Spring_Options_Delay_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Options_Delay()
    }
}
