//
//  BasicAnimations_AnimatableProperties_Color.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/6/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_Color {
    private var animationDuration: Double = 0.38

    private let titleText = "Animatable Properties"
    private let subtitleText = "Color"
    private let descriptionText = "You can animate the change from one color to another."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_Color: View {
    var body: some View {
        VStack(spacing: 30) {
            descriptionSection
                .layoutPriority(1)

            Group {
                withAnimationSection
                noAnimationSection
            }
            .padding(.horizontal)
            .font(.title)
            
            Spacer()
            
            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_AnimatableProperties_Color {
    var rectangleColor: Color {
        isAnimated ? .purple : .orange
    }
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_Color {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: descriptionText)
        }
    }

    private var withAnimationSection: some View {
        VStack {
            Text("With Animation")
            
            RoundedRectangle(cornerRadius: 12)
                .fill(rectangleColor)
                .animation(.easeInOut(duration: animationDuration))
        }
    }

    private var noAnimationSection: some View {
        VStack {
            Text("No Animation")

            RoundedRectangle(cornerRadius: 12)
                .fill(rectangleColor)
        }
    }

    private var animationToggleButton: some View {
        Button(action: {
            self.isAnimated.toggle()
        }) {
            Text("Animate ⚡️")
                .font(.title)
        }
    }
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_Color_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_Color()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
