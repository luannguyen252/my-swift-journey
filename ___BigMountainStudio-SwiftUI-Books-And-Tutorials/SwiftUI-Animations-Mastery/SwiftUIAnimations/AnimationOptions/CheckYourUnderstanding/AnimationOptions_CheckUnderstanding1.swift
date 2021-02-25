//
//  AnimationOptions_CheckUnderstanding1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AnimationOptions_CheckUnderstanding1: View {
    @State private var change = false
    @State private var colorChange = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Check Understanding")
            SubtitleText("Prevent Animation")
            BannerText("Prevent the color animation")
            
            Button("Change") {
                self.change.toggle()
                self.colorChange.toggle()
            }
            
            RoundedRectangle(cornerRadius: change ? 50 : 0)
                .frame(width: 200, height: 200)
                .foregroundColor(colorChange ? .blue : .orange)
        }.font(.title)
    }
}

struct AnimationOptions_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_CheckUnderstanding1()
    }
}
