//
//  If_Else_Solution_Refactor.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct If_Else_Solution_Refactor: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2").edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 30) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("If Else Solution Refactor").foregroundColor(Color("LightAccent2"))
                BannerText("You can move the animation modifier to a parent view (Group, VStack, or the ZStack).", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }.padding(.bottom)
                
                Group {
                    if change {
                        Image("reading.book.female")
                            .transition(.move(edge: .leading))
                    }
                    
                    if change == false {
                        Image("reading.book.male")
                            .transition(.move(edge: .trailing))
                    }
                }
                // Option 1
                //.animation(.default)
                
                Spacer()
            }
            // Option 2
            //.animation(.default)
        }
        .font(.title)
        .accentColor(Color("Accent2"))
        // Option 3
        .animation(.default)
    }
}

struct If_Else_Solution_Refactor_Previews: PreviewProvider {
    static var previews: some View {
        If_Else_Solution_Refactor()
    }
}
