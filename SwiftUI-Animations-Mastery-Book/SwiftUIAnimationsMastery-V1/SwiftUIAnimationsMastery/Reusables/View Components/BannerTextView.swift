//
//  BannerTextView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/3/20.
// ✌️
//

import SwiftUI

struct BannerTextView {
    var text: String
    var textColor: Color = .primary
    var backgroundColor: Color = .purple
    var font: Font = .title
}

// MARK: - View
extension BannerTextView: View {
    var body: some View {
        Text(text)
            .font(font)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(textColor)
            .background(backgroundColor)
    }
}

// MARK: - Computeds
extension BannerTextView {  }

// MARK: - View Variables
extension BannerTextView {  }

// MARK: - Private Helpers
private extension BannerTextView {  }

// MARK: - Preview
struct BannerText_Previews: PreviewProvider {
    static var previews: some View {
        BannerTextView(text: "SwiftUI")
    }
}
