//
//  RoundedBorder.swift
//  ViewExtensionsForBetterReusability
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


public struct RoundedBorder<BorderStyle> where BorderStyle: ShapeStyle {
    public let borderContent: BorderStyle
    public let width: CGFloat
    public let cornerRadius: CGFloat
    
    
    public init(
        _ borderContent: BorderStyle,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 0
    ) {
        self.borderContent = borderContent
        self.width = width
        self.cornerRadius = cornerRadius
    }
}


// MARK: - ViewModifier
extension RoundedBorder: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderContent, lineWidth: width)
            )
    }
}
