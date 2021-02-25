//
//  Curve_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 2/3/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curve_Challenge1: View {
    @State private var menuSelection = "car"
    private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)
    private var smallScale: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            backgroundGradient.edgesIgnoringSafeArea(.all)
            
            HStack {
                Rectangle()
                    .fill(Color("Accent4"))
                    .frame(width: 60)
                    .edgesIgnoringSafeArea(.vertical)
                
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Button(action: {
                        self.menuSelection = "car"
                    }) {
                        Image(systemName: "car.fill")
                    }
                    .background(
                        Circle()
                            .fill(Color("Accent4"))
                            .frame(width: 100, height: 100))
                        .offset(x: menuSelection == "car" ? 0 : -10)
                        .scaleEffect(menuSelection == "car" ? 1 : smallScale)
                    
                    Spacer()
                    
                    Button(action: {
                        self.menuSelection = "tram"
                    }) {
                        Image(systemName: "tram.fill")
                    }
                    .background(
                        Circle()
                            .fill(Color("Accent4"))
                            .frame(width: 100, height: 100))
                        .offset(x: menuSelection == "tram" ? 0 : -10)
                        .scaleEffect(menuSelection == "tram" ? 1 : smallScale)
                    
                    Spacer()
                    
                    Button(action: {
                        self.menuSelection = "airplane"
                    }) {
                        Image(systemName: "airplane")
                    }
                    .background(
                        Circle()
                            .fill(Color("Accent4"))
                            .frame(width: 100, height: 100))
                        .offset(x: menuSelection == "airplane" ? 0 : -10)
                        .scaleEffect(menuSelection == "airplane" ? 1 : smallScale)
                    
                    Spacer()
                }
                .accentColor(Color("Tertiary4"))
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .font(.largeTitle)
        .animation(Animation.timingCurve(0.2, 1, 0.5, 1.5, duration: 0.3))
    }
}

struct Curve_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Curve_Challenge1()
    }
}
