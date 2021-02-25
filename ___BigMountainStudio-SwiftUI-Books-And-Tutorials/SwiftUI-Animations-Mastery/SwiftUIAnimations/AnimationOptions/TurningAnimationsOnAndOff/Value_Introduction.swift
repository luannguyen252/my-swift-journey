//
//  Value_Introduction.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Value_Introduction: View {
    @State private var change = false
    @State private var animateOnChange = false
    
    var body: some View {
        VStack(spacing: 40) {
            TitleText("Value")
            SubtitleText("Introduction")
            BannerText("The first parameter for the animation modifier is the Animation itself. The second parameter is 'value'. It's optional. When you change this value, the animation takes effect. If it doesn't change since the last animation, then there will be no animation. It HAS to change for the animation to happen.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
                
                if self.change {
                    // Only apply animation when Change is true
                    // (Every other time)
                    self.animateOnChange.toggle()
                }
            }
            
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150)
                .animation(Animation.easeIn(duration: 2), value: animateOnChange)
            
        }.font(.title)
    }
}

struct Value_Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Value_Introduction()
    }
}
