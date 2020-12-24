//
//  TabWaveShape.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TabWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let midWidth = width/2
        
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: 50, y: 7))
        path.addQuadCurve(
            to: CGPoint(x: midWidth - 40, y: 5),
            control: CGPoint(x: 100, y: 20))
        path.addQuadCurve(
            to: CGPoint(x: midWidth + 40, y: 5),
            control: CGPoint(x: midWidth, y: -8))
        path.addQuadCurve(
            to: CGPoint(x: width - 50, y: 7),
            control: CGPoint(x: width - 100, y: 20))
        
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}
