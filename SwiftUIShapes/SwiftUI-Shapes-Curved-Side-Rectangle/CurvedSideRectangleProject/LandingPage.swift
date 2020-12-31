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
                        CurvedSideRectangle()
                            .fill(Color.themeTertiary)
                            .frame(height: 160.0)
                            .shadow(radius: 10, y: 5)
                            .overlay(
                                Text("Curved-Side Rectangle")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        )
                        
                        Spacer()
                        
                        VStack(spacing: 20.0) {
                            HStack(spacing: 16.0) {
                                NavigationLink(destination: CurvedSideRectangleFilled()) {
                                    CurvedSideRectangle(bottomOffset: 25)
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 5)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Fill Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white))
                                }
                                NavigationLink(destination: CurvedSideRectangleClipMe()) {
                                    CurvedSideRectangle(bottomOffset: 25)
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 5)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Clip Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white))
                                }
                            }
                            
                            HStack(spacing: 16.0) {
                                NavigationLink(destination: CurvedSideRectangleLayerMe()) {
                                    CurvedSideRectangle(bottomOffset: 25)
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 5)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Layer Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white))
                                }
                                
                                NavigationLink(destination: CurvedSideRectangleAnimateMe()) {
                                    CurvedSideRectangle(bottomOffset: 25)
                                        .fill(Color.themeAccent)
                                        .shadow(radius: 10, y: 5)
                                        .frame(maxWidth: .infinity)
                                        .overlay(
                                            Text("Animate Me")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white))
                                }
                            }
                        }
                        .foregroundColor(.themeForeground)
                        .padding([.horizontal, .bottom])
                        .frame(height: gr.size.height * 0.55)
                        
                        Spacer()
                        
                        CurvedSideRectangle(topOffset: 20, bottomOffset: 0)
                            .fill(Color.themeTertiary)
                            .frame(height: 100.0)
                            .shadow(radius: 10)
                    }
                    .edgesIgnoringSafeArea(.vertical)
                }
            }
        }
        .accentColor(.themeAccent)
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
//            .preferredColorScheme(.dark)
    }
}
