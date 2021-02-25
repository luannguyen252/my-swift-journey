//
//  Custom_AnyTransition.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var zoomInAndOut: AnyTransition {
        .asymmetric(insertion: AnyTransition.scale(scale: 0.1, anchor: .topTrailing)
                        .combined(with: .offset(y: 120)),
                    removal: AnyTransition.scale(scale: 0.2)
                        .combined(with: .opacity))
    }
    
    static func zoomIn(from anchor: UnitPoint) -> AnyTransition {
        return .asymmetric(insertion: AnyTransition.scale(scale: 0.1, anchor: anchor)
                            .combined(with: .offset(y: 120)),
                           removal: AnyTransition.scale(scale: 0.2)
                            .combined(with: .opacity))
    }
}

struct Custom_AnyTransition: View {
    @State private var showHelp = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Custom AnyTransition").foregroundColor(Color("LightAccent2"))
                BannerText("Create a new transition by extending AnyTransition and adding a static property or function.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                ZStack(alignment: .topTrailing) {
                    MapView()
                    Button(action: {
                        withAnimation(.spring()) {
                            self.showHelp = true
                        }
                    }, label: {
                        Image(systemName: "questionmark.circle.fill")
                    }).padding()
                }.edgesIgnoringSafeArea(.vertical)
            }
            
            // Help View
            if showHelp {
                VStack(spacing: 20) {
                    Text("Help")
                        .foregroundColor(Color("LightShade2"))
                    Image("location")
                    Button("Close") {
                        withAnimation(.easeIn) {
                            self.showHelp = false
                        }
                    }.padding(.top, 30)
                }
                .padding(35)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("DarkAccent2")))
                .padding(.top, 100)
                .shadow(radius: 15)
//                .transition(.zoomInAndOut)
                .transition(.zoomIn(from: .topTrailing))
                .zIndex(1)
            }
        }
        .accentColor(Color("Accent2"))
        .font(.title)
    }
}

struct Custom_AnyTransition_Previews: PreviewProvider {
    static var previews: some View {
        Custom_AnyTransition()
    }
}
