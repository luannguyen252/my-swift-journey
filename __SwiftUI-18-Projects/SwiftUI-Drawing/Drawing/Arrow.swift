//
//  Arrow.swift
//  Drawing
//
//  Created by Sandesh on 14/06/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

//Challenge 1
struct Arrow: View {
    var body: some View {
        ArrowShape()
            .strokeBorder(Color.green, lineWidth: 20)
            //.fill(Color.red)
            .background(Color.gray)
            .clipped()
    }
}

struct ArrowShape:Shape, InsettableShape {
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.insetAmont += amount/2
        return shape
    }
    
    var insetAmont: CGFloat = 10
    
    func path(in rect: CGRect) -> Path {
        
        var arrowPath = Path()
        var trianglePath = Path()
        var arrowTailPath = Path()
        
        
        trianglePath.move(to: CGPoint(x: rect.midX, y: 0))
        trianglePath.addLine(to: CGPoint(x: rect.midX + 50, y: 100))
        trianglePath.addLine(to: CGPoint(x: rect.midX - 50, y: 100))
        trianglePath.closeSubpath()
    
        arrowTailPath.move(to: CGPoint(x: rect.midX + 5, y: 100))
        arrowTailPath.addLine(to: CGPoint(x: rect.midX + 5, y: 250))
        arrowTailPath.addLine(to: CGPoint(x: rect.midX - 5, y: 250))
        arrowTailPath.addLine(to: CGPoint(x: rect.midX - 5, y: 100))
        
        
        arrowPath.addPath(trianglePath)
        arrowPath.addPath(arrowTailPath)
        
        
        return arrowPath
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
