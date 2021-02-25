//
//  Combining_ThreeEffects.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Combining_ThreeEffects: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Combining Three Effects").foregroundColor(Color("LightAccent2"))
                BannerText("You can combine more than 2 effects. Also notice that order does matter. This is like the previous example but the first two effects have been switched.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                Spacer()
                
                HStack(alignment: .bottom) {
                    Button(action: {
                        withAnimation {
                            self.change.toggle()
                        }
                    }, label: {
                        Image(systemName: "macwindow")
                    })
                    if change {
                        Image("window")
                            .transition(AnyTransition.scale(scale: 0.1, anchor: .bottomLeading)
                                .combined(with: .move(edge: .leading))
                                .combined(with: .opacity))
                    }
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            }
            .font(.title)
            .accentColor(Color("Accent2"))
        }
    }
}

struct Combining_ThreeEffects_Previews: PreviewProvider {
    static var previews: some View {
        Combining_ThreeEffects()
    }
}
