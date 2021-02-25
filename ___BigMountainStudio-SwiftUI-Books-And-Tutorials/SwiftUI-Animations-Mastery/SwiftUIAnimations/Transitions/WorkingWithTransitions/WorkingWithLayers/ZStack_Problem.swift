//
//  ZStack_Problem.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ZStack_Problem: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("ZStack Problem").foregroundColor(Color("LightAccent2"))
                BannerText("When a view in a ZStack has a transition, sometimes it looks as though the removal effect is not working. This is because the view is getting moved UNDER the other layers and cannot be seen.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                Button("Show") {
                    self.show.toggle()
                }
            }.blur(radius: show ? 10 : 0)
            
            if show {
                VStack {
                    Image("collaboration")
                    Button("Close") {
                        withAnimation(.easeIn) {
                            self.show = false
                        }
                    }.padding(.top, 30)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("DarkAccent2"))
                .shadow(radius: 20))
                .transition(.slide)
                .animation(.default)
            }
        }.font(.title).accentColor(Color("Accent2"))
    }
}

struct ZStack_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Problem()
    }
}
