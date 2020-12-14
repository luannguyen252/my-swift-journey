//
//  CustomShape.swift
//  CustomCurvesAndShapes
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct CustomShape: Shape {
    // MARK: - PROPERTIES
    var corner: UIRectCorner
    var radii: CGFloat

    // MARK: - DRAW BEZIER PATH
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        return Path(path.cgPath)
    }
}
