//
//  BuoyView.swift
//  Waves
//
//  Created by Stephen DeStefano on 11/11/20.
//

import SwiftUI

struct BuoyView: View {
    @Binding var tiltForwardBackward: Bool
    @Binding var upAndDown: Bool
    @Binding var leadingAnchorAnimate: Bool
    
    @State private var red = 1.0
    @State private var green = 1.0
    @State private var blue = 1.0
    
    var body: some View {
        ZStack {
            Image("buoy").overlay(Rectangle()
                                    .overlay(Color(red: red,green: green,blue: blue)).cornerRadius(5).frame(width: 11, height: 16).position(x: 112.5, y: 20))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
                .rotationEffect(.degrees(leadingAnchorAnimate ? 7 : -3), anchor: .leading)
                .animation(Animation.easeOut(duration: 0.9).repeatForever(autoreverses: true))
                .onAppear() {
                    leadingAnchorAnimate.toggle()
                }
                .rotationEffect(.degrees(tiltForwardBackward ? -20 : 15))
                .offset(y: upAndDown ? -10 : 10)
                .animation(Animation.easeInOut(duration: 1.0).delay(0.2).repeatForever(autoreverses: true))
                .onAppear() {
                    tiltForwardBackward.toggle()
                    upAndDown.toggle()
                    red = 0.5
                    green = 0.5
                    blue = 0.5
                }
        }
    }
}

struct BuoyView_Previews: PreviewProvider {
    static var previews: some View {
        BuoyView(tiltForwardBackward: .constant(true), upAndDown: .constant(true), leadingAnchorAnimate: .constant(true))
    }
}
