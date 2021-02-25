//
//  Animate_TextSize_ScaleEffect_Solution.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_TextSize_ScaleEffect_Solution: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Text Size with ScaleEffect")
            BannerText("Start with the larger font size first (so it's clear) and then scale it down as the begin state.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
            }
            
            Spacer()
            
            Text("Hello!")
                .font(.system(size: 80))
                .scaleEffect(change ? 1 : 0.25)
                .animation(.easeInOut)
                .border(Color.blue)
            
            Spacer()
            
        }.font(.title)
    }
}

struct Animate_TextSize_ScaleEffect_Solution_Previews: PreviewProvider {
    static var previews: some View {
        Animate_TextSize_ScaleEffect_Solution()
    }
}
