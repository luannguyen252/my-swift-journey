//
//  BasicAnimations_AnimatableProperties_TextResizing.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/9/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_TextResizing {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 150, height: 40)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Text Size with Scale Effect"
    private let descriptionText = "Start with the larger font size first (so it's clear) and then scale it down as the begin state."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_TextResizing: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(2)

            Text("SwiftUI")
                .foregroundColor(Color.pink)
                .font(.system(size: 80))
                .scaleEffect(isAnimated ? 1.0 : 0.25)

            VStack(spacing: 22) {
                BannerTextView(text: "Otherwise, scaling up will be blurry.")
                
                Text("SwiftUI")
                    .foregroundColor(Color.pink)
                    .font(.system(size: 20))
                    .scaleEffect(isAnimated ? 4.0 : 1.0)
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
extension BasicAnimations_AnimatableProperties_TextResizing {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_TextResizing {
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
private extension BasicAnimations_AnimatableProperties_TextResizing {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_TextResizing_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_TextResizing()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
