//
//  If_Else_Solution.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct If_Else_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2").edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 30) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("If Else Solution").foregroundColor(Color("LightAccent2"))
                BannerText("What you will have to do is put each view into its own if statement to get it to work properly.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }.padding(.bottom)
                
                if change {
                    Image("reading.book.female")
                        .transition(.move(edge: .leading))
                        .animation(.default)
                }
                
                if change == false {
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

struct If_Else_Solution_Previews: PreviewProvider {
    static var previews: some View {
        If_Else_Solution()
    }
}
