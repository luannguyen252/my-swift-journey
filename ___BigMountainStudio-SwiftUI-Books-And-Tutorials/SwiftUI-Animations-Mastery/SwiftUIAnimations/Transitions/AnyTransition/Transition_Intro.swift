//
//  Transition_Intro.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Intro: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Introduction").foregroundColor(Color("LightAccent2"))
                BannerText("Use the transition modifier to specify how a view enters and exits the screen.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    self.change.toggle()
                }
                
                Spacer()
                
                if change {
                    Image("driving")
                        .transition(AnyTransition.slide)
                        .animation(.default)
                }
                
                Spacer()
            }
            .font(.title)
            .accentColor(Color("Accent2"))
        }
    }
}

struct Transition_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Intro()
    }
}
