//
//  AnimatableGraph.swift
//  Music
//
//  Created by Clifton on 2021-01-18.
//

import SwiftUI

struct AnimatableGraph: Shape {
    var controlPoints: AnimatableVector
    var closedArea: Bool
    
    var animatableData: AnimatableVector {
        set { self.controlPoints = newValue }
        get { return self.controlPoints }
    }
    
    func point(index: Int, rect: CGRect) -> CGPoint {
        let value = self.controlPoints.values[index]
        let x = Double(index)/Double(self.controlPoints.values.count)*Double(rect.width)
        let y = Double(rect.height)*value
        return CGPoint(x: x, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let startPoint = self.point(index: 0, rect: rect)
            path.move(to: startPoint)
            
            var i = 1;
            while i < self.controlPoints.values.count {
                path.addLine(to:  self.point(index: i, rect: rect))
                i += 1;
            }
            
            if (self.closedArea) { // closed area below the chart line
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: 0, y: rect.height))
                path.addLine(to: startPoint)
            }
        }
    }
}

