//
//  AnimationTriggers_Sliders.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/13/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_Sliders {
    private var animationDuration: Double = 0.38

    private let titleText = "Animation Triggers"
    private let subtitleText = "Sliders"
    private let descriptionText = "When adjusting a slider, there may be some UI element you are changing that can be animated."
    
    @State private var sliderProgress: CGFloat = 0.0
}

// MARK: - View
extension AnimationTriggers_Sliders: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)
            
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Color.blue
                        .frame(width: geometry.size.width * self.sliderProgress)
                    
                    Color.green
                }
            }
            .animation(self.sliderAnimation)
            
            Slider(value: $sliderProgress, in: 0...1) {
                Text("Slider Progress")
            }
            .padding()
        }
        .navigationBarTitle("")
    }
}

// MARK: - Computeds
extension AnimationTriggers_Sliders {
    var sliderAnimation: Animation {
        .easeOut(duration: animationDuration)
    }
}

// MARK: - View Variables
extension AnimationTriggers_Sliders {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: descriptionText, textColor: .white, backgroundColor: .green)
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_Sliders {
}

// MARK: - Preview
struct AnimationTriggers_Sliders_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_Sliders()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
