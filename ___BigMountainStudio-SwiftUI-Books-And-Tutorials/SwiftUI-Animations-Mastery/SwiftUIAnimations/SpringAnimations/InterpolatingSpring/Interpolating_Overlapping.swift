//
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interpolating_Overlapping: View {
    @State private var degrees = 0.0
    @State private var taps = 0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                TitleText("Interpolating Spring")
                    .foregroundColor(Color("Gold"))
                SubtitleText("Overlapping the Animation")
                BannerText("Triggering an interpolatingSpring multiple times can increase the strength of the animation each time.", backColor: Color("Gold"))
                
                Circle()
                    .fill(Color("Gold"))
                    .frame(width: 300, height: 300)
                    .overlay(Image(systemName: "arrow.up").offset(y: -120))
                    .rotationEffect(.degrees(degrees))
                    .animation(Animation.interpolatingSpring(stiffness: 1, damping: 0.8))
                    .onTapGesture {
                        self.degrees += 25
                        self.taps += 1
                }
                
                Text("Taps: \(taps)")
                    .foregroundColor(Color("Gold"))
                
            }.font(.title)
        }
    }
}

struct Interpolating_Overlapping_Previews: PreviewProvider {
    static var previews: some View {
        Interpolating_Overlapping()
    }
}
