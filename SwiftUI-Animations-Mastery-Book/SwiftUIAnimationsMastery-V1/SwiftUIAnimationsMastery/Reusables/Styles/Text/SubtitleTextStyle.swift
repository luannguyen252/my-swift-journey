//
//  SubtitleTextStyle.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/3/20.
// ✌️
//

import SwiftUI

public struct SubtitleTextStyle {
    var color: Color

    // MARK: - Init
    public init(
        color: Color = .gray
    ) {
        self.color = color
    }
}

// MARK: - ViewModifier
extension SubtitleTextStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(color)
    }
}

// MARK: - Preview
struct SubtitleTextStyle_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
