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
                        ZStack {
                            HStack {
                                TrapeziumShape()
                                    .fill(Color.themeTertiary)
                                    .frame(width: 60, height: 180)
                                TrapeziumShape(corner: .bottomRight)
                                    .fill(Color.themeTertiary)
                                    .frame(width: 60, height: 180)
                            }
                            Text("The Trapezium")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .padding(.bottom)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: VideoDemonstration()) {
                            HStack(spacing: 0.0) {
                                TrapeziumShape(offset: 0.4, corner: .topLeft)
                                    .fill(Color.themeAccent)
                                TrapeziumShape(offset: 0.6, corner: .bottomRight)
                                    .fill(Color.themeAccent)
                            }
                            .overlay(
                                Text("Video Demo")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white))
                        }
                        .frame(width: 300, height: 80)
                        
                        Spacer()
                        
                        VStack(spacing: 20.0) {
                            HStack(spacing: 16.0) {
                                NavigationLink(destination: TrapeziumFilled()) {
                                    TrapeziumShape(offset: 0.75, corner: .bottomRight)
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
                                NavigationLink(destination: TrapeziumClipShape()) {
                                    TrapeziumShape()
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
                                NavigationLink(destination: OutlinesAndOverlapping()) {
                                    TrapeziumShape(offset: 0.25,corner: .topRight)
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
                                
                                NavigationLink(destination: Parallelogram()) {
                                    TrapeziumShape(offset: 0.25,corner: .topLeft)
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
                        .padding(.horizontal)
                        .frame(height: gr.size.height * 0.55)
                    }
                }
                .edgesIgnoringSafeArea(.top)
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
            .preferredColorScheme(.dark)
    }
}
