//
//  AnimationOptions_RepeatingWithCount.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/13/20.
// ✌️
//

import SwiftUI

struct AnimationOptions_RepeatingWithCount {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    
    private let titleText = "Animation Repeating"
    private let subtitleText = "Repeat Count"
    private let descriptionText1 = "You might want an animation to repeat a specific number of times."
    
    private let twirlDuration: TimeInterval = 0.63
    private let twirlCount = 4
    
    @State private var animationFlag = false
}

// MARK: - View
extension AnimationOptions_RepeatingWithCount: View {
    var body: some View {
        VStack(spacing: 0) {
            descriptionSection
                .layoutPriority(2)
            
            Spacer()
            
            hurricaneView
                .frame(width: 300, height: 300)
            
            Spacer()
            
            AnimationToggleButton { self.animationFlag.toggle() }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationOptions_RepeatingWithCount {
    var pulseAnimation: Animation {
        Animation
            .linear(duration: twirlDuration)
            .repeatCount(twirlCount)
    }
}

// MARK: - View Variables
extension AnimationOptions_RepeatingWithCount {
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

    private var hurricaneView: some View {
        Image(systemName: "hurricane")
            .resizable()
            .scaledToFit()
            .foregroundColor(.accentColor)
            .rotationEffect(.radians(self.animationFlag ? 2 * .pi : 0.0))
            .animation(self.pulseAnimation)
    }
}

// MARK: - Private Helpers
private extension AnimationOptions_RepeatingWithCount {  }

// MARK: - Preview
struct AnimationOptions_RepeatingWithCount_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationOptions_RepeatingWithCount()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
