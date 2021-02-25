//
//  Trigger_OnDisappear.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Trigger_OnDisappear: View {
    @State private var showTip = true
    @State private var showTipButton = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("On Disappear")
            BannerText("When you make a view go away, you can trigger an animation on how it disappears.", backColor: .green)

            Spacer()
            
            if showTip {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Spacer()
                        Text("Tip of the Day")
                        Spacer()
                    }.foregroundColor(.white)
                    Spacer()
                    Button("Got It") {
                        self.showTip.toggle()
                    }
                }
                .padding()
                .background(Rectangle().fill(Color.green).shadow(radius: 3))
                .padding(.horizontal)
                .frame(height: 200)
                .onDisappear {
                    // Gets triggered when the view is removed from the screen
                    self.showTipButton = true
                }
            }
            
            if showTipButton {
                HStack {
                    Button(action: {
                        self.showTipButton = false
                        self.showTip = true
                    }) {
                        Image(systemName: "info.circle")
                    }.padding(.leading, 24)
                    Spacer()
                }
            }
            
        }
        .animation(.default) // Animate the adding and removing of views from the screen
        .font(.title)
    }
}

struct Trigger_OnDisappear_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_OnDisappear()
    }
}
