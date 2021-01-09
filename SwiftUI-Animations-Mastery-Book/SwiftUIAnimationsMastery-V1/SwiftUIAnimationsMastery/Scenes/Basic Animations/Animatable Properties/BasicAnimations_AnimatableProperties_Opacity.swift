//
//  BasicAnimations_AnimatableProperties_Opacity.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/8/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_Opacity {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 100, height: 100)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Opacity"
    private let descriptionText = "Opacity is the quality of thickness, solidness or opaqueness. The more opacity the more solid something (less transparent)."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_Opacity: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)

            RoundedRectangle(cornerRadius: 12)
                .fill(Color.pink)
                .padding(.horizontal)
                .opacity(isAnimated ? 1 : 0)
            
            Spacer()
            
            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_AnimatableProperties_Opacity {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_Opacity {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: descriptionText)
        }
    }

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
private extension BasicAnimations_AnimatableProperties_Opacity {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_Opacity_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_Opacity()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
