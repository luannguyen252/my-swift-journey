//
//  VertialLine.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct VertialLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        return path
    }
}
