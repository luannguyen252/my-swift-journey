//
//  Animate_Size_Frame.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_Size_Frame: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Frame")
            BannerText("You can animate the size of an object through the frame modifier's height and width parameters.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .frame(width: change ? 100 : 350, height: change ? 100 : 200)
                .scaleEffect(change ? 0.5 : 1)
                
            
            BannerText("Notice how this changes the layout of the screen. You may want to consider animating with the scaleEffect instead.", backColor: .blue, textColor: .white)
        }.font(.title).animation(.easeInOut)
    }
}

struct Animate_Size_Frame_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Size_Frame()
    }
}
