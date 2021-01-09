//
//  BasicAnimations_AnimatableProperties_RotationEffect.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/8/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_RotationEffect {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 250, height: 250)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Rotation Effect"
    private let descriptionText = "Rotations can also be animated."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_RotationEffect: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)

            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.pink)
                    .overlay(Image(systemName: "arrow.right").foregroundColor(.black).imageScale(.large))
                    .frame(
                        width: self.exampleObjectSize.width,
                        height: self.exampleObjectSize.height
                    )
                    .rotationEffect(.radians(self.isAnimated ? .pi * 1.5 : 0))
            }
            .padding(.horizontal)
            
            Spacer()
            
            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_AnimatableProperties_RotationEffect {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_RotationEffect {
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
private extension BasicAnimations_AnimatableProperties_RotationEffect {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_RotationEffect_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_RotationEffect()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

