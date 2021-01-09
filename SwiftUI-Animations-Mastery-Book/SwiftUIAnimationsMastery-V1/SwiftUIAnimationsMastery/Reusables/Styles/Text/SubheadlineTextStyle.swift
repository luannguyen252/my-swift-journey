//
//  SubheadlineTextStyle.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/3/20.
// ✌️
//

import SwiftUI

public struct SubheadlineTextStyle {
    var color: Color
    
    // MARK: - Init
    public init(
        color: Color = .secondary
    ) {
        self.color = color
    }
}

// MARK: - ViewModifier
extension SubheadlineTextStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(color)
    }
}

// MARK: - Preview
struct SubheadlineTextStyle_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
