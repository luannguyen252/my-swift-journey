//
//  LineGraph.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct LineGraph: Shape {
    let data: [CGFloat]
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let height = rect.height
        
        let valueHeightRatio: CGFloat = 2.5 // because rect height 300 and scale value is 750
        let space: CGFloat = 90
        
        var x: CGFloat = 20
        var y: CGFloat = height - data[0]/valueHeightRatio
        
        path.move(to: CGPoint(x: x, y: y))
        var previousPoint = CGPoint(x: x, y: y)
        
        for i in 0..<data.count {
            y = height - data[i]/valueHeightRatio
            
            let currentPoint = CGPoint(x: x, y: y)
            let controlPoint1 = CGPoint(x: previousPoint.x + 40, y: previousPoint.y)
            let controlPoint2 = CGPoint(x: currentPoint.x - 40, y: currentPoint.y)
            
            if i != 0 {
                path.addCurve(to: currentPoint, control1: controlPoint1, control2: controlPoint2)
            }
            
            previousPoint = currentPoint
            x += space
        }
        return path
    }
}
