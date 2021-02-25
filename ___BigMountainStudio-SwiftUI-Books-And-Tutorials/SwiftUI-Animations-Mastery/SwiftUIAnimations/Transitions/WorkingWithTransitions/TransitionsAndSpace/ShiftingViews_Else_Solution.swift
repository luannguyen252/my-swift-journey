//
//  Transition_Placeholders_Solution.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ShiftingViews_Else_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Using Else Solution").foregroundColor(Color("LightAccent2"))
                BannerText("Transitions work with views that are inserted and removed from the screen (view hierarchy). Insertion and removal will adjust views around them.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }
                
                if change {
                    Image("collaboration")
                        .transition(.slide)
                        .animation(.default)
                } else {
                    Image("collaboration")
                        .hidden()
                }
                
                BannerText("Solution: Using a hidden view in the else.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
            }
            .font(.title)
            .accentColor(Color("Accent2"))
        }
    }
}

struct ShiftingViews_Else_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingViews_Else_Solution()
    }
}
