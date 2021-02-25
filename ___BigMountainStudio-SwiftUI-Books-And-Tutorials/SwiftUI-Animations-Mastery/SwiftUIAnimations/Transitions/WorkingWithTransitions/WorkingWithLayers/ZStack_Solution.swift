//
//  ZStack_Solution.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ZStack_Solution: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("ZStack Solution").foregroundColor(Color("LightAccent2"))
                BannerText("The solution is pretty simple. You just need to add zIndex modifier to the view with the transition.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
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
                .zIndex(1)
            }
        }.font(.title).accentColor(Color("Accent2"))
    }
}

struct ZStack_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Solution()
    }
}
