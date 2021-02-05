//
//  ContentView.swift
//  Drawing
//
//  Created by Sandesh on 02/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

//Notes
//SwiftUI Provides underlying object Path() to draw shapes
//It is low levelObject, Paths are Views just like Shape , Colors etc
//Paths needs tobe wrapped inside a view as it is positioned based on coordinate poins which varies from device to device or inside GeometryReader to place the path in view accordingly


struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            //path.addLine(to: CGPoint(x: 200, y: 100))
            
            
            path.closeSubpath()
        }
            //.fill(Color.orange)
            .stroke(Color.red.opacity(0.33), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
