//
//  AnimationOptions_SequencingWithDelays.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/12/20.
// ✌️
//

import SwiftUI

struct AnimationOptions_SequencingWithDelays {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    
    private let titleText = "Animation Delays"
    private let subtitleText = "Sequencing"
    private let descriptionText1 = "Delays can be a useful way to sequence and stagger animations."
    
    private let stripeSlideDuration: TimeInterval = 0.33
    private let stripeSlideOffsetDuration: TimeInterval = 0.09
    private let stripeCount = 30
    
    @State private var isShowingMainImage = false
}

// MARK: - View
extension AnimationOptions_SequencingWithDelays: View {
    var body: some View {
        VStack(spacing: 0) {
            descriptionSection
                .layoutPriority(2)
                
            mainImageSection
                .edgesIgnoringSafeArea(.horizontal)

            Spacer()
            
            AnimationToggleButton { self.isShowingMainImage.toggle() }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationOptions_SequencingWithDelays {
    var stripeAnimation: Animation {
        Animation
            // .linear(duration: stripeSlideDuration)
            .easeIn(duration: stripeSlideDuration)
    }
    
    var stripeColor: Color {
        colorScheme == .dark ? .white : .black
    }
}

// MARK: - View Variables
extension AnimationOptions_SequencingWithDelays {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(
                text: descriptionText1,
                textColor: .white,
                backgroundColor: .purple,
                font: horizontalSizeClass == .regular ? .largeTitle : .title
            )
        }
    }

    private var mainImageSection: some View {
        ZStack {
            Image("cat-peeking")
                .resizable()
                .scaleEffect(1.5)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0 ..< stripeCount) { index in
                    Rectangle()
                        .fill(self.stripeColor)
                        .offset(
                            x: self.isShowingMainImage ?
                                UIScreen.main.bounds.width * (index.isMultiple(of: 2) ? 1 : -1)
                                : 0.0,
                            y: 0.0
                        )
                        .animation(
                            self.stripeAnimation
                                .delay(self.stripeDelay(at: index))
                        )
                }
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationOptions_SequencingWithDelays {
    func stripeDelay(at index: Int) -> TimeInterval {
        let totalDistanceToCenter = stripeCount / 2
        let indexDistanceFromCenter = abs(index - (stripeCount / 2))
        let delayFactor = totalDistanceToCenter - indexDistanceFromCenter
        
        return stripeSlideOffsetDuration * TimeInterval(delayFactor)
    }
}

// MARK: - Preview
struct AnimationOptions_SequencingWithDelays_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationOptions_SequencingWithDelays()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
