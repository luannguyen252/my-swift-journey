//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct WaveFilled: View {
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            VStack {
                Wave()
                    .fill(Color.themeTertiary)
                    .frame(height: 120.0)
                    .shadow(radius: 4)
                    .overlay(Text("Filled Wave")
                        .font(.largeTitle)
                        .fontWeight(.bold))
                
                Spacer()
                
                VStack(spacing: 40.0) {
                    Text("Customization Options")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Apply different colors and curve amounts")
                    
                    Wave(yOffset: 0.25)
                        .fill(Color.themeAccent)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("yOffset: 0.25")
                                .foregroundColor(.themeForeground))
                    
                    Wave(yOffset: 0.8)
                        .fill(Color.themeForeground)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("yOffset: 0.8")
                                .foregroundColor(.themeBackground))
                    
                    Wave(yOffset: -0.75)
                        .fill(Color.themeSecondary)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("yOffset: -0.75")
                                .foregroundColor(.themeForeground))
                }
                .padding(.bottom)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
        .foregroundColor(.themeForeground)
    }
}

struct WaveFilled_Previews: PreviewProvider {
    static var previews: some View {
        WaveFilled()
            .preferredColorScheme(.dark)
    }
}
