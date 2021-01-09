//
//  BasicAnimations_AnimatableProperties_GeoemetryReaderPosition.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/8/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_GeoemetryReaderPosition {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 100, height: 100)

    private let titleText = "Animatable Properties"
    private let subtitleText = "In Geometry Reader"
    private let descriptionText = "You can animate the center point (position) of a view within a GeometryReader's coordinate space."
    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_GeoemetryReaderPosition: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)

            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.pink)
                    .frame(width: self.exampleObjectSize.width, height: self.exampleObjectSize.height)
                        .position(
                            CGPoint(
                                x: self.isAnimated ?
                                    geometry.size.width - (self.exampleObjectSize.width / 2)
                                    : (self.exampleObjectSize.width / 2),
                                y: self.isAnimated ?
                                    geometry.size.height - (self.exampleObjectSize.height / 2)
                                    : (self.exampleObjectSize.height / 2)
                            )
                        )
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
extension BasicAnimations_AnimatableProperties_GeoemetryReaderPosition {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_GeoemetryReaderPosition {
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
private extension BasicAnimations_AnimatableProperties_GeoemetryReaderPosition {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_GeoemetryReaderPosition_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_GeoemetryReaderPosition()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
