//
//  Animate_TextSize_Scale.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_TextSize_ScaleEffect: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Text Size with ScaleEffect")
            BannerText("Let's try to scale the text view instead.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
            }
            
            Spacer()
            
            Text("Hello!")
                .font(.system(size: 20))
                .scaleEffect(change ? 4 : 1)
                .animation(.easeInOut)
                .border(Color.blue)
            
            Spacer()
            
        }.font(.title)
    }
}

struct Animate_TextSize_ScaleEffect_Previews: PreviewProvider {
    static var previews: some View {
        Animate_TextSize_ScaleEffect()
    }
}
