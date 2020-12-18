//
//  CShape.swift
//  TranslucentBackgroundEffect
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

//: MARK: - ROUNDED CORNERS FOR SEPARATE EDGES
struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
