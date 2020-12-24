//
//  ExpenceLineGraph.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ExpenceLineGraph: Shape {
    var data: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if data.count == 0 {
            return path
        }
        
        var x: CGFloat = 30
        var y: CGFloat = data[0] + 40
        path.move(to: CGPoint(x: x, y: y))
        var previousPoint = CGPoint(x: x, y: y)
        x += 55
        
        for i in 1..<data.count {
            y = data[i] + 40
            let currentPoint = CGPoint(x: x, y: y)
            let controlPoint1 = CGPoint(x: previousPoint.x + 25, y: previousPoint.y)
            let controlPoint2 = CGPoint(x: currentPoint.x - 25, y: currentPoint.y)
            
            path.addCurve(to: currentPoint, control1: controlPoint1, control2: controlPoint2)
            
            previousPoint = CGPoint(x: x, y: y)
            x += 55
        }
        return path
    }
}
