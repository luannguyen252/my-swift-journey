//
//  If_Else_Problem.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct If_Else_Problem: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2").edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 30) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("If Else Problem").foregroundColor(Color("LightAccent2"))
                BannerText("Transitions define how views are inserted and removed. This means you will have views in an if block. But what about switching between two views using the else block? Take a look:", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }.padding(.bottom)
                
                if change {
                    Image("reading.book.female")
                        .transition(.move(edge: .leading))
                        .animation(.default)
                } else {
                    Image("reading.book.male")
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                }
                Spacer()
            }
        }
        .font(.title)
        .accentColor(Color("Accent2"))
    }
}

struct If_Else_Problem_Previews: PreviewProvider {
    static var previews: some View {
        If_Else_Problem()
    }
}
