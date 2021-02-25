//
//  Transition_MoveAndFade.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Opacity: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Transition")
            SubtitleText("Opacity")
            BannerText("The opacity transition will just fade in the view and fade it out.")
            
            Button("Change") {
                self.change.toggle()
            }
            
            if change {
                Circle()
                    .foregroundColor(.orange)
                    .padding()
                    // Notice "AnyTransition" isn't used here. It's optional.
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.7))
            } else {
                Circle()
                    .foregroundColor(.orange)
                    .padding()
                    .hidden()
            }
            BannerText("This transition is easy to implement but I want you aware of the limitation. You cannot specify the degree of opacity. It's either opaque (solid) or transparent.")
        }.font(.title)
    }
}

struct Transition_Opacity_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Opacity()
    }
}
