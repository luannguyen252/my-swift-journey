//
//  BasicAnimations_AnimatableProperties_Trim.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/9/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_Trim {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 150, height: 150)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Trim"
    private let descriptionText = "Animating the trim of a circle is a great way to show progress."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_Trim: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(2)

            Circle()
                .trim(from: 0, to: isAnimated ? 0.25 : 1.0)
                .rotation(.radians(-.pi / 2))
                .stroke(
                    Color.pink,
                    style: StrokeStyle(
                        lineWidth: 12,
                        lineCap: .round
                    )
                )
                .frame(width: exampleObjectSize.width, height: exampleObjectSize.height)
            
            Spacer()
            
            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_AnimatableProperties_Trim {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_Trim {
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
private extension BasicAnimations_AnimatableProperties_Trim {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_Trim_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_Trim()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
