//
//  Animate_ExcludeModifiers.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_ExcludeModifiers: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Two Modifiers")
            BannerText("You can animate multiple properties at the same time. Apple will interpolate the differences.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
            }
            
            Spacer()
            Text("Animate color & scale")
            Circle()
                .foregroundColor(change ? Color.blue : Color.orange)
                .scaleEffect(change ? 1.5 : 1)
                .frame(height: 80)
                .padding(40)
                .animation(.easeInOut(duration: 1))
            
            Text("Animate just the scale")
            // I can't get this to work right. It's not working like in Apple's example.
            Circle()
                .foregroundColor(change ? Color.blue : Color.orange)
                .animation(nil)
                .scaleEffect(change ? 1.5 : 1)
                .frame(height: 80)
                .padding(40)
                .animation(.easeInOut(duration: 1))
            
            Spacer()
        }.font(.title)
    }
}

struct Animate_ExcludeModifiers_Previews: PreviewProvider {
    static var previews: some View {
        Animate_ExcludeModifiers()
    }
}
