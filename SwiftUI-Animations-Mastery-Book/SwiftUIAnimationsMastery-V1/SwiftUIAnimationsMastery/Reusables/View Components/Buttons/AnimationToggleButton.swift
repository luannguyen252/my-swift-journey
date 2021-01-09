//
//  AnimationToggleButton.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/12/20.
// ✌️
//

import SwiftUI

struct AnimationToggleButton {
    var title: String = "Animate ⚡️"
    var onTap: (() -> Void) = {}
}

// MARK: - View
extension AnimationToggleButton: View {
    var body: some View {
        Button(action: onTap) {
            Text(title)
                .font(.title)
        }
    }
}

// MARK: - Preview
struct AnimationToggleButtons_Previews: PreviewProvider {
    static var previews: some View {
        AnimationToggleButton()
    }
}
