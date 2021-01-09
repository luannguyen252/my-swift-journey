//
//  BasicAnimations_CheckUnderstanding1.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_CheckUnderstanding1 {
    private let animationDuration: Double = 0.4
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_CheckUnderstanding1: View {
    // ✅ You want to resize the middle `RoundedRectangle` view below without shifting
    // the other views around it. What could you do?
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
            
            RoundedRectangle(cornerRadius: 10)
                .scaleEffect(isAnimated ? 0.5 : 1.0)
                // .frame(width: isAnimated ? 300 : 200, height: isAnimated ? 300 : 200)
            
            RoundedRectangle(cornerRadius: 10)

            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_CheckUnderstanding1 {
}

// MARK: - View Variables
extension BasicAnimations_CheckUnderstanding1 {
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
private extension BasicAnimations_CheckUnderstanding1 {
}

// MARK: - Preview
struct BasicAnimations_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_CheckUnderstanding1()
    }
}
