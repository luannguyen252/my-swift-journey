//
//  Duration_Long_Example.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Duration_Long_Example: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Image(systemName: "cloud.sun.fill")
                .font(.system(size: 200))
                .foregroundColor(.purple)
                .opacity(0.3)
                .offset(x: change ? 240 : -240, y: 20)
                .animation(.linear(duration: 15)) // 15 seconds
            
            Image(systemName: "cloud.fill")
                .font(.system(size: 200))
                .foregroundColor(.purple)
                .opacity(0.3)
                .offset(x: change ? -240 : 240, y: 200)
                .animation(.linear(duration: 10)) // 10 seconds
            
            VStack(spacing: 20) {
                TitleText("Animation Options")
                SubtitleText("Long Duration Example")
                BannerText("Sometimes you want a very long duration to create subtle effects on your UI.", backColor: .purple, textColor: .white)
                Spacer()
                Button("Change") {
                    self.change.toggle()
                }
            }.font(.title)
        }
    }
}

struct Duration_Long_Example_Previews: PreviewProvider {
    static var previews: some View {
        Duration_Long_Example()
    }
}
