//
//  BasicAnimations_AnimatableProperties_Offset.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/7/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_Offset {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 100, height: 100)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Offset"
    private let descriptionText = "Animate the location of a view using X and Y coordinates."

    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_Offset: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)

            
            GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink)
                        .frame(width: self.exampleObjectSize.width, height: self.exampleObjectSize.height)
                        .offset(
                            x: self.offsetWidth(forRectIn: geometry),
                            y: 0
                        )
            }
            .padding(.horizontal)
            .frame(height: self.exampleObjectSize.height)
            
            
            VStack(spacing: 22) {
                BannerTextView(
                    text: "Offset also uses a CGSize object. A width with positive value moves right, negative values move left. For height, positive values move up, negative values move down."
                )
                .layoutPriority(1)
                
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink)
                        .frame(width: self.exampleObjectSize.width, height: self.exampleObjectSize.height)
                        .offset(
                            CGSize(
                                width: self.offsetWidth(forRectIn: geometry),
                                height: 0
                            )
                        )
                }
                .padding(.horizontal)
                .frame(height: self.exampleObjectSize.height)
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
extension BasicAnimations_AnimatableProperties_Offset {
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_Offset {
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
private extension BasicAnimations_AnimatableProperties_Offset {
    func offsetWidth(forRectIn geometry: GeometryProxy) -> CGFloat {
        isAnimated ?
            (geometry.size.width / 2) - (self.exampleObjectSize.width / 2)
            : -(geometry.size.width / 2) + (self.exampleObjectSize.width / 2)
    }
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_Offset_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_Offset()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
