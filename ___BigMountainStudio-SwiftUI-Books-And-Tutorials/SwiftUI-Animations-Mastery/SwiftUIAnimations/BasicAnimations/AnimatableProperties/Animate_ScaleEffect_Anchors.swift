//
//  Animate_ScaleEffect.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_ScaleEffect_Anchors: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Scale From Anchors")
            BannerText("You can scale around an anchor of your choosing. The default is scaling from the center anchor.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .overlay(Text("Scale from top").foregroundColor(.white))
                .scaleEffect(change ? 1 : 0.25, anchor: .top) // Add anchor location
                .animation(.default)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .overlay(Text("Scale from right").foregroundColor(.white))
                .scaleEffect(change ? 0.25 : 1, anchor: .trailing)
                .animation(.default)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .overlay(Text("Scale from bottom left").foregroundColor(.white))
                .scaleEffect(change ? 1 : 0.5, anchor: .bottomLeading)
                .animation(.default)
        }.font(.title)
    }
}

struct Animate_ScaleEffect_Anchors_Previews: PreviewProvider {
    static var previews: some View {
        Animate_ScaleEffect_Anchors()
    }
}
