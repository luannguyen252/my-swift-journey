//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LandingPage: View {
    var body: some View {
        NavigationView {
            GeometryReader { gr in
                ZStack {
                    Color.themeBackground
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Wave()
                            .fill(Color.themeTertiary)
                            .frame(height: 120.0)
                            .shadow(radius: 4)
                            .overlay(Text("The Wave Shape")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.white))
                        
                        Spacer()
                        
                        VStack(spacing: 40.0) {
                            HStack(spacing: 16.0) {
                                NavigationLink(destination: WaveFilled()) {
                                    Wave()
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 10)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Fill Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(.bottom, 24))
                                }
                                NavigationLink(destination: WaveClipMe()) {
                                    Wave()
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 10)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Clip Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(.bottom, 24))
                                }
                            }
                            
                            HStack(spacing: 16.0) {
                                NavigationLink(destination: WavesOverlapping()) {
                                    Wave()
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 10)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Layer Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(.top, 24))
                                }
                                
                                NavigationLink(destination: WavesAnimated()) {
                                    Wave()
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 10)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Animate Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(.top, 24))
                                }
                            }
                        }
                        .foregroundColor(.themeForeground)
                        .padding([.horizontal, .bottom])
                        .frame(height: gr.size.height * 0.5)
                        
                        Spacer()
                        
                        Wave()
                            .fill(Color.themeTertiary)
                            .frame(height: 50.0)
                            .shadow(radius: 4)
                            .scaleEffect(x: -1, y: -1) // Flip it around to make it upside down.
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
