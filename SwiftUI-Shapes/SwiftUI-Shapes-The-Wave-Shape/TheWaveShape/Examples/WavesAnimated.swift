//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct WavesAnimated: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack(alignment: .top) {
                    Wave(yOffset: change ? 0.7 : -0.7)
                        .fill(Color.themeTertiary)
                        .frame(height: 150.0)
                        .shadow(radius: 4)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    
                    Wave(yOffset: change ? -0.5 : 0.5)
                        .fill(Color.themeTertiary)
                        .opacity(0.8)
                        .frame(height: 130.0)
                        .shadow(radius: 4)
                        .overlay(Text("Animated Wave")
                            .font(.largeTitle)
                            .fontWeight(.bold))
                        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                }
                
                Spacer()
                
                Button("Start") {
                    self.change.toggle()
                }
                .font(.largeTitle)
                .foregroundColor(.themeAccent)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
        .foregroundColor(.themeForeground)
    }
}

struct WavesAnimated_Previews: PreviewProvider {
    static var previews: some View {
        WavesAnimated()
    }
}
