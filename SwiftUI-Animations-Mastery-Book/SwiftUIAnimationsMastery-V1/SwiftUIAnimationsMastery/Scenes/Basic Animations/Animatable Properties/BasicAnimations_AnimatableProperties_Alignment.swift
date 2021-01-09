//
//  BasicAnimations_AnimatableProperties_Alignment.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/8/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatableProperties_Alignment {
    private var animationDuration: Double = 0.38
    private var exampleObjectSize = CGSize(width: 100, height: 100)

    private let titleText = "Animatable Properties"
    private let subtitleText = "Alignment"
    private let descriptionText = "You can animate the alignment change inside the container view."

    
    @State private var isAnimated = false
}

// MARK: - View
extension BasicAnimations_AnimatableProperties_Alignment: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)

            VStack(alignment: currentHorizontalAlignment) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.pink)
                    .frame(width: self.exampleObjectSize.width, height: self.exampleObjectSize.height)
                
                HStack {
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            
            VStack(spacing: 22) {
                BannerTextView(
                    text: "Inside an HStack"
                )
                .layoutPriority(1)

                HStack(alignment: currentVerticalAlignment) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink)
                        .frame(width: self.exampleObjectSize.width, height: self.exampleObjectSize.height)
                        .padding(.horizontal)
                    
                    VStack {
                        Spacer()
                    }
                }
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
extension BasicAnimations_AnimatableProperties_Alignment {
    var currentHorizontalAlignment: HorizontalAlignment {
        isAnimated ?  .trailing : .leading
    }
    
    var currentVerticalAlignment: VerticalAlignment {
        isAnimated ? .bottom : .top
    }
}

// MARK: - View Variables
extension BasicAnimations_AnimatableProperties_Alignment {
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
private extension BasicAnimations_AnimatableProperties_Alignment {
}

// MARK: - Preview
struct BasicAnimations_AnimatableProperties_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatableProperties_Alignment()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
