//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct WaveClipMe: View {
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { gp in
                VStack(spacing: 24) {
                    Image("waves")
                        .frame(width: gp.size.width, height: 210)
                        .clipShape(Wave(yOffset: 0.4))
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("CREATE WAVES")
                                .font(Font.system(size: 70))
                                .fontWeight(.black)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .opacity(0.7))
                    Spacer()
                    
                    VStack(spacing: 20.0) {
                        Text("Shapes can be used as masks to clip shapes. This only worked right because the image is taller than wide.")
                        
                        Text("The problem is that the shape goes outside of its frame, so you'll have to fix this.")
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("More Options!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Use scaleEffect to flip the wave shape vertically (or just create a new wave shape). 👇")
                    
                    Wave()
                        .fill(LinearGradient(gradient: Gradient(colors: [.themeSecondary, .themeTertiary]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 120.0)
                        .shadow(radius: 4)
                        .scaleEffect(x: 1, y: -1) // Flip it around to make it upside down.
                }
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct WaveClipMe_Previews: PreviewProvider {
    static var previews: some View {
        WaveClipMe()
    }
}
