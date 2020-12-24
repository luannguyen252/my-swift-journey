//
//  SliderShape.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct SliderShape: Shape {
    var progress: CGFloat
    let step: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let gap: CGFloat = 8
        
        let progressHeight = height * (1 - progress)
        let stepCount = 1/step
        let gapHeight = (stepCount - 1) * gap
        let stepHeight = (height - gapHeight) / stepCount
        let progressStep = progress / step
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        var y = progressHeight
        
        for _ in stride(from: 0, to: progressStep, by: 1) {
            path.addRect(CGRect(
                            x: 0,
                            y: y,
                            width: width,
                            height: stepHeight))
            y += (stepHeight + gap)
        }
        
        return path
    }
}
