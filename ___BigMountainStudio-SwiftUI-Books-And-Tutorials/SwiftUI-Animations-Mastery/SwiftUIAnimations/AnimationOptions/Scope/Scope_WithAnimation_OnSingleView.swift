//
//  Scope_WithAnimation_OnSingleView.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scope_WithAnimation_OnSingleView: View {
    @State private var flipVertically = false
    @State private var flipHorizontally = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("On a Single View")
            BannerText("Animating from a state variable is very powerful because it allows you to animate a single property, independently of other property animations.'", backColor: .yellow, textColor: .black)
        
            HStack(spacing: 50) {
                Button(action: {
                    withAnimation {
                        self.flipHorizontally.toggle()
                    }
                }) {
                    Image(systemName: "flip.horizontal.fill").font(.system(size: 50)).padding()
                }
                
                Button(action: {
                    withAnimation {
                        self.flipVertically.toggle()
                    }
                }) {
                    Image(systemName: "flip.horizontal.fill").font(.system(size: 50))
                        .rotationEffect(.degrees(90)).padding()
                }
            }
            
            Image("day")
                .resizable()
                .padding(.horizontal)
                .scaleEffect(x: flipHorizontally ? -1 : 1,
                             y: flipVertically ? -1 : 1)
        }.font(.title)
    }
}

struct Scope_WithAnimation_OnSingleView_Previews: PreviewProvider {
    static var previews: some View {
        Scope_WithAnimation_OnSingleView()
    }
}
