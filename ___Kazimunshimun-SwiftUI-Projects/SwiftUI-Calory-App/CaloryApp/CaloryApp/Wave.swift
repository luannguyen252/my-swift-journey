//
//  Wave.swift
//  CaloryApp
//
//  Created by Anik on 30/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct Wave: Shape {
    let graphWidth: CGFloat
    let amplitude: CGFloat
    
    func path(in rect: CGRect) -> Path {
            let width = rect.width * 2
            let height = rect.height

            let origin = CGPoint(x: -rect.width/2, y: height * 0.50)

            var path = Path()
            path.move(to: origin)

            var endY: CGFloat = 0.0
            let step = 5.0
            for angle in stride(from: step, through: Double(width + width/2) * (step * step), by: step) {
                let x = origin.x + CGFloat(angle/360.0) * (width + width/2) * graphWidth
                let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
                path.addLine(to: CGPoint(x: x, y: y))
                endY = y
            }
            path.addLine(to: CGPoint(x: width + width/2, y: endY))
            path.addLine(to: CGPoint(x: width + width/2, y: height))
            path.addLine(to: CGPoint(x: -rect.width/2, y: height))
            path.addLine(to: CGPoint(x: -rect.width/2, y: origin.y))

            return path
    }
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        Wave(graphWidth: 1, amplitude: 0.05)
    }
}
