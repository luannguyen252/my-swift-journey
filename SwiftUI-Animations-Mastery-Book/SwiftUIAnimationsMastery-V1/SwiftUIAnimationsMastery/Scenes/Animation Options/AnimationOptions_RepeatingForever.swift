//
//  AnimationOptions_RepeatingForever.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/14/20.
// ✌️
//

import SwiftUI

struct AnimationOptions_RepeatingForever {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    
    private let titleText = "Animation Repeating"
    private let subtitleText = "Repeat Forever"
    private let descriptionText1 = "Animations can be set to repeat forever -- with the option to auto-reverse"
    
    private let twirlDuration: TimeInterval = 0.63
    
    @State private var shouldReverseAnimation = false
    @State private var animationFlag = false
}

// MARK: - View
extension AnimationOptions_RepeatingForever: View {
    var body: some View {
        VStack(spacing: 12) {
            descriptionSection
                .layoutPriority(2)
            
            HStack {
                Spacer()
                Toggle(isOn: $shouldReverseAnimation) {
                    Text("Auto-Reverse Animation")
                        .font(.headline)
                }
                Spacer()
            }
            .padding()
            
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
extension AnimationOptions_RepeatingForever {
    var pulseAnimation: Animation {
        Animation
            .linear(duration: twirlDuration)
            .repeatForever(autoreverses: shouldReverseAnimation)
    }
}

// MARK: - View Variables
extension AnimationOptions_RepeatingForever {
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
private extension AnimationOptions_RepeatingForever {  }

// MARK: - Preview
struct AnimationOptions_RepeatingForever_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationOptions_RepeatingForever()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
