//
//  SplashView.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/9/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            GeometryReader { geometry in
                ZStack {
                    //blur image behind the doors
                    Image("blurImage").resizable()
                        .blur(radius: 10)
                        .opacity(self.change ? 0 : 1)              .animation(Animation.easeIn.delay(3.3))
                    
                    //doors opening
                    HStack(spacing: -5) {
                        Image("Left Door").resizable().aspectRatio(contentMode: .fill)
                            .padding(.top, -5)
                            .offset(x: self.change ? -geometry.size.width  / 1.5 : 0)
                        
                        Image("Right Door").resizable().aspectRatio(contentMode: .fill)
                            .padding(.top, -5)
                            .offset(x: self.change ? geometry.size.width / 1.5 : 0)
                    }.animation(Animation.easeInOut(duration: 25.0).speed(5.0).delay(0.3))
                    
                    //gears spinning
                    GearAnimation()
                }
            }
        }.edgesIgnoringSafeArea([.top, .bottom])
            .onAppear {
                self.change = true
        }
    }
}

struct GearAnimation: View {
    @State private var degrees = 0.0
    @State private var showGears = false
    
    var body: some View {
        VStack(spacing: 20) {
            //top gear
            Image("gear").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
                .rotationEffect(Angle.degrees(degrees))
                .offset(y: 60)
                .gesture(RotationGesture()
                    .onChanged({ (angle) in
                        self.degrees = angle.degrees
                    }))
                .animation(Animation.easeInOut(duration: 5).speed(1.3))
            
            //middle gear
            Image("gear").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 175)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
                .rotationEffect(-Angle.degrees(degrees))
                .offset(x: 80, y: 4)
                .animation(Animation.easeInOut(duration: 5).speed(1.3))
            
            //bottom gear
            Image("gear").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
                .rotationEffect(Angle.degrees(degrees))
                .offset(x: 20, y: -45)
                .animation(Animation.easeInOut(duration: 5).speed(1.3))
        }.padding(.trailing, 40)
        
        //make the gears dissappear when the doors finish opening
        .opacity(showGears ? 0 : 1)
        .animation(Animation.easeIn.delay(3.3))
        .onAppear() {
            self.degrees += 360
            self.showGears = true
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
