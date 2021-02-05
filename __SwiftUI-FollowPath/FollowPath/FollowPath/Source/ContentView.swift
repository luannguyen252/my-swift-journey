//
//  ContentView.swift
//  Path
//
//  Created by Sudarshan Sharma on 12/4/20.
//

import SwiftUI

struct ContentView: View {
    private let animation1 = Animation.linear(duration: 100.0).repeatForever(autoreverses: false)
    @State var rotationAngle1: Angle = Angle(degrees: 0)
    
    var body: some View {
        ZStack {
            RotatingImageView("mars",
                              animationDuration: 20.0,
                              foregroundColor: Color(UIColor(named: "UFOGreen")!),
                              imageSize: CGSize(width: 26.5, height: 26.5),
                              pathSize: CGSize(width: 175.0, height: 175.0),
                              showBackgroundCircle: true)

            RotatingImageView("earth",
                              animationDuration: 25.0,
                              foregroundColor: Color(UIColor(named: "BaraRed")!),
                              imageSize: CGSize(width: 50.0, height: 50.0),
                              pathSize: CGSize(width: 140.0, height: 140.0),
                              showBackgroundCircle: true)

            RotatingImageView("venus",
                              animationDuration: 20.0,
                              foregroundColor: Color(UIColor(named: "CoolGray")!),
                              imageSize: CGSize(width: 47.5, height: 47.5),
                              pathSize: CGSize(width: 100.0, height: 100.0),
                              showBackgroundCircle: true)
            
            RotatingImageView("mercury",
                              animationDuration: 20.0,
                              foregroundColor: Color(UIColor(named: "RadiantYellow")!),
                              imageSize: CGSize(width: 19.0, height: 19.0),
                              pathSize: CGSize(width: 60.0, height: 60.0),
                              showBackgroundCircle: true)
            
            Image("sun")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 100.0)
                .rotationEffect(rotationAngle1)
        }
        .background(Color(UIColor(named: "PrestigeBlue")!))
        .edgesIgnoringSafeArea([.top, .bottom])
        .onAppear {
            withAnimation(animation1) {
                rotationAngle1.degrees += 360
            }
        }
    }
}
