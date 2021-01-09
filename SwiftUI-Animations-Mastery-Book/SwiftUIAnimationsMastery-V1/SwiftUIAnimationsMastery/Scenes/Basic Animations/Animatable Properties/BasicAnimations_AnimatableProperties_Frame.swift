//
//  BasicAnimations_AnimatableProperties_Frame.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/8/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_Frame {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 150, height: 150)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Frame"
    private let descriptionText = "You can rotate around an anchor of your choosing. The default is rotating around the center anchor."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_Frame: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(2)

            Group {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.pink)
                    .frame(
                        width: isAnimated ? (exampleObjectSize.width / 2) : exampleObjectSize.width,
                        height: isAnimated ? (exampleObjectSize.height / 2) : exampleObjectSize.height
                    )
                    .padding(.horizontal)
            }
            
            BannerTextView(text: "Notice how this changes the layout of the screen. You may want to consider animating with the scaleEffect instead.")
                .layoutPriority(1)

            Spacer()
            
            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_AnimatableProperties_Frame {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_Frame {
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
private extension BasicAnimations_AnimatableProperties_Frame {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_Frame_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_Frame()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
