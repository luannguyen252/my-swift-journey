//
//  ShiftingViews_Clipped_Solution.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/10/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ShiftingViews_Clipped_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Clipped Solution")
                    .foregroundColor(Color("LightAccent2"))
                BannerText("Use the clipped modifier on the parent view around the view being transitioned.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }
                
                VStack {
                    Divider()
                    if change {
                        Image("collaboration")
                            .zIndex(1)
                            .transition(.slide)
                    }
                }
                .clipped() // Don't render outside VStack
                .animation(.default)

                BannerText("Notice what happens when the view is inserted here.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
            }
            .font(.title)
            .accentColor(Color("Accent2"))
        }
    }
}

struct ShiftingViews_Clipped_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingViews_Clipped_Solution()
    }
}
