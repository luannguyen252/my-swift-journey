//
//  RoundedShape.swift
//  TravelApp2
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 45, height: 45))
        return Path(path.cgPath)
    }
}
