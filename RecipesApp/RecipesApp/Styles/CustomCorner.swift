//
//  CustomCorner.swift
//  RecipesApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var size: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
        return Path(path.cgPath)
    }
}
