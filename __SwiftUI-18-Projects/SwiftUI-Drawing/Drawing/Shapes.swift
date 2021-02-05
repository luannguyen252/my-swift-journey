//
//  Shapes.swift
//  Drawing
//
//  Created by Sandesh on 30/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

/*Whenever SwiftUI draws any thing over a path it draws it ecacting on the center line for example
 Circle()
 .stroke(Color.red, lineWidth: 40)
 
 the above code will draw the path on centerline, but since the line width of the path is 40 it will draw the 20 points inside the circle and 20 points outside
 
 and since the swiftUI draws in available space it usally ends up taking the entire available space resulting in clipping at the edges
 
 Solution: use strokeBorder Instead of stoke, which is part of InsettableShape protocol
 
 */
struct Shapes: View {
    var body: some View {
        
        Arc(startAngle: .degrees(0), endEngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.red, lineWidth: 40)
        
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
                
        return path
    }
}

struct Arc: Shape, InsettableShape {
    var startAngle: Angle
    var endEngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let newStart = startAngle - rotationAdjustment
        let newEnd = endEngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2-insetAmount, startAngle: newStart, endAngle: newEnd, clockwise: !clockwise)
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
 }
struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
            .previewLayout(.sizeThatFits)
    }
}
