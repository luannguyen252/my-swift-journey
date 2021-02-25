//
//  Transition_Offset.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Offset: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Offset").foregroundColor(Color("LightAccent2"))
                BannerText("The offset transition moves in FROM the offset you specify.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }
                
                Spacer()
                
                if change {
                    Image("driving")
                        .transition(.offset(x: 200, y: -200))
                        .animation(.easeInOut(duration: 1))
                }
                
                Spacer()
            }
            .font(.title)
            .accentColor(Color("Accent2"))
        }
    }
}

struct Transition_Offset_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Offset()
    }
}
