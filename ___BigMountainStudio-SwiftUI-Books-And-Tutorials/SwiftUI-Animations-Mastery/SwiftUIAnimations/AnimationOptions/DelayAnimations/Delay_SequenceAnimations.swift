//
//  Delay_SequenceAnimations.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Delay_SequenceAnimations: View {
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Delay")
            SubtitleText("Sequence Animations")
            BannerText("Use the delay to sequence animations.", backColor: .red, textColor: .white)
            Spacer()
            VStack(spacing: 60) {
                Group {
                    Image(systemName: "1.circle")
                        .opacity(show ? 1 : 0)
                        .animation(Animation.easeIn.delay(0.5))
                    Image(systemName: "2.circle")
                        .opacity(show ? 1 : 0)
                        .animation(Animation.easeIn.delay(0.9))
                    Image(systemName: "3.circle")
                        .opacity(show ? 1 : 0)
                        .animation(Animation.easeIn.delay(1.3))
                }.font(.system(size: 100))
                
                Button("Go!", action: {})
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .padding(25)
                    .background(Circle().fill(Color.green))
                    .opacity(show ? 1 : 0)
                    .animation(Animation.easeIn.delay(1.7))
            }.onAppear { self.show = true }
            Spacer()
        }
        .font(.title)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Delay_SequenceAnimations_Previews: PreviewProvider {
    static var previews: some View {
        Delay_SequenceAnimations()
    }
}
