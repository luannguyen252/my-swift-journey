//
//  GeometryReader_GettingCoordinates.swift
//  100Views
//
//  Created by Mark Moeykens on 7/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct GeometryReader_GettingCoordinates : View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GeometryReader", subtitle: "Getting Coordinates", desc: "Getting the coordinates (x, y) of a geometry view is little different. Take a look at this example:", back: .clear)
                .layoutPriority(1)
            
            GeometryReader { geometryProxy in
                VStack(spacing: 10) {
                    Text("X: \(geometryProxy.frame(in: CoordinateSpace.local).origin.x)")
                    Text("Y: \(geometryProxy.frame(in: CoordinateSpace.local).origin.y)")
                }
                .padding()
                .foregroundColor(.white)
            }
            .background(Color.pink)
            
            Text("The local coordinate space will always give you zeros.")
            Text("You need to look globally to get the coordinates inside the current view:")
            GeometryReader { geometryProxy in
                VStack(spacing: 10) {
                    Text("X: \(geometryProxy.frame(in: .global).origin.x)")
                    Text("Y: \(geometryProxy.frame(in: .global).origin.y)")
                }
                .padding()
                .foregroundColor(.white)
            }
            .background(Color.pink)
            .frame(height: 200)
        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct GeometryReader_GettingCoordinates_Previews : PreviewProvider {
    static var previews: some View {
        GeometryReader_GettingCoordinates()
    }
}
