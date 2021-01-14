//
//  View+RoundedBorder.swift
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//


import Foundation
import SwiftUI


extension View {
    
    public func roundedBorder<BorderStyle>(
        _ content: BorderStyle,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 0
    ) -> some View
        where BorderStyle: ShapeStyle
    {
        self.modifier(
            RoundedBorder(
                content,
                width: width,
                cornerRadius: cornerRadius
            )
        )
    }
}
