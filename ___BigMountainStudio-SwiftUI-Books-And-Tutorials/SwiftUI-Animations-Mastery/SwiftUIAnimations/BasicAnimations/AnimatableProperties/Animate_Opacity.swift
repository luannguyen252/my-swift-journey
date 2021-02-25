//
//  Animate_Opacity.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_Opacity: View {
    @State private var show = false
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Opacity")
            BannerText("Opacity is the quality of thickness, solidness or opaqueness. The more opacity, the more solid something appears (less transparent).", backColor: .blue, textColor: .white)
            
            Button("Show/Hide") {
                self.show.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .padding()
                .opacity(show ? 1 : 0)
                .animation(.easeInOut)
            
        }.font(.title)
    }
}

struct Animate_Opacity_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Opacity()
    }
}
