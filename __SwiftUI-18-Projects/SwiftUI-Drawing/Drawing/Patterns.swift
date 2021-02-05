//
//  Patterns.swift
//  Drawing
//
//  Created by Sandesh on 31/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI
/*
 CGAffineTransform measures angles in radians rather then angles
 */
struct Patterns: View {
    @State private var petalOffset: CGFloat = -20
    @State private var pertalWidth: CGFloat = 100
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: pertalWidth)
                .fill(Color.yellow, style: FillStyle(eoFill: true, antialiased: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40 ... 40)
                .padding()
            
            Text("Petal width")
            Slider(value: $pertalWidth, in: 0 ... 100)
            .padding()
        }
    }
}

struct Flower: Shape {
    var petalOffset: CGFloat = -20
    var petalWidth: CGFloat = 100
    
    func path(in rect: CGRect) -> Path {
        //Main path for the flower
        var path = Path()
        
        for number in stride(from: 0, to: CGFloat.pi*2, by: CGFloat.pi/8) {
            //rotation for single petal, rotated the path with respect to rect x and y points
            let rotation =  CGAffineTransform(rotationAngle: number)
            
            //moving the petal at the center of the super view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            
            let petalPath = Path(ellipseIn: CGRect(x: 0, y: petalOffset, width: petalWidth, height: rect.width/2))
            
            path.addPath(petalPath.applying(position))
        }
        
        
        return path
    }
}
struct Patterns_Previews: PreviewProvider {
    static var previews: some View {
        Patterns()
    }
}
