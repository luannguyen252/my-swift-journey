//
//  TitleTextStyle.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/3/20.
// ✌️
//

import SwiftUI

public struct TitleTextStyle {
    var color: Color

    public init(
        color: Color = .primary
    ) {
        self.color = color
    }
}

extension TitleTextStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(color)
    }
}
