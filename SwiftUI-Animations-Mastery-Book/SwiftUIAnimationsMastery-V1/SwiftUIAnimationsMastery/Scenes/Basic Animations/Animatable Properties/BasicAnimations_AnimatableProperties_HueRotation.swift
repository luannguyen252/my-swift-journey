//
//  BasicAnimations_AnimatableProperties_HueRotation.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/6/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_HueRotation {
    private var animationDuration: Double = 0.38

    private let titleText = "Animatable Properties"
    private let subtitleText = "Hue"
    private let descriptionText = "Another way to change color is to change the hue on the color wheel by rotating the current point."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_HueRotation: View {
    var body: some View {
        VStack(spacing: 30) {
            descriptionSection
                .layoutPriority(1)

            VStack(spacing: 22.0) {
                Image("ColorWheel")
                
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue)
                        .hueRotation(.radians(hueRotationAngle))
                        .animation(.easeInOut(duration: animationDuration))
                        .frame(width: 180)
                    
                    Image("umbrella")
                        .resizable()
                        .scaledToFit()
                        .hueRotation(.radians(hueRotationAngle))
                        .animation(.easeInOut(duration: animationDuration))
                }
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
extension BasicAnimations_AnimatableProperties_HueRotation {
    var hueRotationAngle: Double {
        .pi * (isAnimated ? 0.5 : 0.0)
    }
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_HueRotation {
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
            self.isAnimated.toggle()
        }) {
            Text("Animate ⚡️")
                .font(.title)
        }
    }
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_HueRotation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_HueRotation()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
