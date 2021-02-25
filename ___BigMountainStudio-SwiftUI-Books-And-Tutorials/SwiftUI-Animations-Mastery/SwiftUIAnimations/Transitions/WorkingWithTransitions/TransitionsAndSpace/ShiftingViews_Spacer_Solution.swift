//
//  ShiftingViews_Spacer_Solution.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ShiftingViews_Spacer_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Using Spacer Solution").foregroundColor(Color("LightAccent2"))
                BannerText("Transitions work with views that are inserted and removed from the screen (view hierarchy). Insertion and removal will adjust views around them.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }
                
                Spacer()
                
                if change {
                    Image("collaboration")
                        .transition(.slide)
                        .animation(.default)
                }
                
                Spacer()
                
                BannerText("Solution: Using spacers and filling the space.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
            }
            .font(.title)
            .accentColor(Color("Accent2"))
        }
    }
}

struct ShiftingViews_Spacer_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingViews_Spacer_Solution()
    }
}
