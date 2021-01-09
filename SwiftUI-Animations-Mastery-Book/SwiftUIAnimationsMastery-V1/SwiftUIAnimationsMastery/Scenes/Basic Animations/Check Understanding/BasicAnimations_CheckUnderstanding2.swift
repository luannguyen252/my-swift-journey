//
//  BasicAnimations_CheckUnderstanding2.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_CheckUnderstanding2 {
    private let animationDuration: Double = 0.4
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_CheckUnderstanding2: View {
    // ✅ You want to make text get bigger and smaller in a smooth animated
    // way without it getting blurry. How could you do this?
    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 10)
                
                Text("SwiftUI")
                    .font(.system(size: 80))
                    .scaleEffect(isAnimated ? 1.0 : 0.25)
                
                RoundedRectangle(cornerRadius: 10)
            }
            .padding(.horizontal)

            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_CheckUnderstanding2 {
}

// MARK: - View Variables
extension BasicAnimations_CheckUnderstanding2 {
    private var animationToggleButton: some View {
        Button(action: {
            withAnimation(
                Animation.easeInOut(duration: self.animationDuration)
            ) {
                self.isAnimated.toggle()
            }
        }) {
            Text("Animate ⚡️")
                .font(.title)
        }
    }
}

// MARK: - Private Helpers
private extension BasicAnimations_CheckUnderstanding2 {
}

// MARK: - Preview
struct BasicAnimations_CheckUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_CheckUnderstanding2()
    }
}
