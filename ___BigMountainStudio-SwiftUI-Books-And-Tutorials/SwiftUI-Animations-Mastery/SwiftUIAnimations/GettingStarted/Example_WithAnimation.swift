//
//  Example_WithAnimation.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Example_WithAnimation: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Example")
            SubtitleText("Parts of Animation")
            BannerText("There is just one thing missing. We want to tell SwiftUI to animate the change in the Y position of the circle!")
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                // 2. The variable's value changing causes the views Y position to change
                .offset(x: 0, y: change ? 300 : 0)
                // 3. Animate the change between the start and stop states
                .animation(Animation.easeInOut)
            
            Spacer()
            
            Button("Change") {
                // 1. The button triggers a variable's value to change
                self.change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Example_WithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Example_WithAnimation()
    }
}
