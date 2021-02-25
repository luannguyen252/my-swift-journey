//
//  Transition_Scale.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Scale: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Scale").foregroundColor(Color("LightAccent2"))
                BannerText("Come into view from the scale specified.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    withAnimation(.default) {
                        self.change.toggle()
                    }
                }
                
                Spacer()
                
                if change {
                    Image("driving")
                        .transition(.scale(scale: 3))
                }
                
                Spacer()
            }
            .font(.title)
            .accentColor(Color("Accent2"))
        }
    }
}

struct Transition_Scale_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Scale()
    }
}
