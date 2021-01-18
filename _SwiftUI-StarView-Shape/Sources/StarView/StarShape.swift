//
//  StarShape.swift
//  
//
//  Created by Enes Karaosman on 9.04.2020.
//

import SwiftUI

public struct StarShape: Shape {
    
    public var starExtrusion: CGFloat = 20.0
    
    private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        return CGPoint(x: radius * cos(angle) + offset.x, y: radius * sin(angle) + offset.y)
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let center = CGPoint(x: rect.midX, y: rect.midY)

        let pointsOnStar = 5

        var angle: CGFloat = -.pi / 2
        let angleIncrement = CGFloat(.pi * 2.0 / Double(pointsOnStar))
        let radius = rect.midX

        for i in 1...pointsOnStar {
            
            let point = self.pointFrom(angle: angle, radius: radius, offset: center)
            let nextPoint = self.pointFrom(angle: angle + angleIncrement, radius: radius, offset: center)
            let midPoint = self.pointFrom(angle: angle + angleIncrement / 2.0, radius: starExtrusion, offset: center)

            if i == 1 { // First point
                path.move(to: point)
            }

            path.addLine(to: midPoint)
            path.addLine(to: nextPoint)

            angle += angleIncrement
        }

        path.closeSubpath()

        return path
    }
    
}
