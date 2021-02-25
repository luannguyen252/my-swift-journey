//
//  Scope_NoAnimation.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/31/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scope_NoAnimation: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Options")
            SubtitleText("Scope - No Animations")
            BannerText("You can also prevent an animation on one of the child views. Use .none parameter in the animation modifier.", backColor: .yellow, textColor: .black)
            
            Button("Change") {
                self.change.toggle()
            }
            
            Text("Uses Parent Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .yellow : .red)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
            
            Text("Uses Own Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .yellow : .orange)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
                .animation(.none) // No animation
        }
        .font(.title)
            .animation(.easeOut) // This applies to all children within
    }
}

struct Scope_NoAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Scope_NoAnimation()
    }
}
