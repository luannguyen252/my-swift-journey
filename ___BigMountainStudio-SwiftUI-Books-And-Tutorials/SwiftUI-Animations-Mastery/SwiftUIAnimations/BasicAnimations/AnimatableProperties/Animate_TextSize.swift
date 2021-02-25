//
//  Animate_TextSize.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_TextSize: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Text Size")
            BannerText("Take a look at what happens when you try to animate the font size of a text view.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
            }
            
            Spacer()
            
            Text("Hello!")
                .font(.system(size: change ? 80 : 20))
                .animation(.easeInOut)
                .border(Color.blue)
            
            Spacer()
        }.font(.title)
    }
}

struct Animate_TextSize_Previews: PreviewProvider {
    static var previews: some View {
        Animate_TextSize()
    }
}
