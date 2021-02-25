//
//  GettingStarted_CheckUnderstanding_WhichCurve.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct GettingStarted_CheckUnderstanding_WhichCurve: View {
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animation Curves")
            
            Group {
                Text("1")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeIn(duration: 2))
                }
                
                Text("2")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration: 2))
                }
                
                
                Text("3")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration: 2))
                }
            }
            
            Button("Move") {
                self.move.toggle()
            }
        }
        .font(.title)
        .padding(.bottom)
    }
}

struct GettingStarted_CheckUnderstanding_WhichCurve_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_CheckUnderstanding_WhichCurve()
    }
}
