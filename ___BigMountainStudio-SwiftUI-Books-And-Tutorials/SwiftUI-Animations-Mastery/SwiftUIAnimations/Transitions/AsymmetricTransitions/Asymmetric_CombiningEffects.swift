//
//  Asymmetric_CombiningEffects.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Asymmetric_CombiningEffects: View {
    @State private var showHelp = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Asymmetric: Combining Effects").foregroundColor(Color("LightAccent2"))
                BannerText("When using the asymmetric function you can still combine effects.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
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
                .transition(.asymmetric(insertion: AnyTransition.scale(scale: 0.1, anchor: .topTrailing)
                                            .combined(with: .offset(y: 120)),
                                        removal: AnyTransition.scale(scale: 0.2)
                                            .combined(with: .opacity)))
                    .zIndex(1)
            }
        }
        .accentColor(Color("Accent2"))
        .font(.title)
    }
}

struct Asymmetric_CombiningEffects_Previews: PreviewProvider {
    static var previews: some View {
        Asymmetric_CombiningEffects()
    }
}
