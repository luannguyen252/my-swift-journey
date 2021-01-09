//
//  BasicAnimations_AnimatableProperties_ScaleEffect.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/8/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_ScaleEffect {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 150, height: 40)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Frame"
    private let descriptionText = "You can animate the size of an object through the scaleEffect modifier values."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_ScaleEffect: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(2)

            Group {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.pink)
                    .frame(width: exampleObjectSize.width, height: exampleObjectSize.height)
                    .scaleEffect(isAnimated ? 0.3 : 1.0)
            }
            .padding(.horizontal)
            
            VStack(spacing: 12) {
                BannerTextView(text: "You can scale around an anchor of your choosing. The default is scaling from the center anchor.")
                    .layoutPriority(2)
                
                Group {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink)
                        .frame(width: exampleObjectSize.width, height: 40)
                        .scaleEffect(isAnimated ? 1.0 : 0.4, anchor: .topLeading)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink)
                        .frame(width: exampleObjectSize.width, height: 40)
                        .scaleEffect(isAnimated ? 0.3 : 1.0, anchor: .bottomTrailing)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink)
                        .frame(width: exampleObjectSize.width, height: 40)
                        .scaleEffect(isAnimated ? 1.20 : 0.5, anchor: .bottom)
                }
                .padding(.horizontal)
            }

            Spacer()
            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_AnimatableProperties_ScaleEffect {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_ScaleEffect {
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
private extension BasicAnimations_AnimatableProperties_ScaleEffect {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_ScaleEffect_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_ScaleEffect()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
