//
//  AnimationOptions_Delays.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/12/20.
// ✌️
//

import SwiftUI

struct AnimationOptions_Delays {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let titleText = "Animation Options"
    private let subtitleText = "Delay"
    private let descriptionText1 = "You can delay the start of an animation after it is triggered."
    
    private let animationDuration: TimeInterval = 0.3
    
    @State private var isShowingGreeting = false
}

// MARK: - View
extension AnimationOptions_Delays: View {
    var body: some View {
        VStack(spacing: 0) {
            descriptionSection
                .layoutPriority(2)
                
            greetingSection
                .edgesIgnoringSafeArea(.horizontal)

            Spacer()
            
            AnimationToggleButton { self.isShowingGreeting.toggle() }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationOptions_Delays {
    var greetingAnimation: Animation {
        Animation
            .easeOut(duration: animationDuration)
            .delay(1.0)
    }

}

// MARK: - View Variables
extension AnimationOptions_Delays {
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
    
    private var greetingSection: some View {
            ZStack {
                VStack {
                    Text("Hello!")
                        .font(.largeTitle)
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                .font(.largeTitle)
                
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.red)
                        .offset(
                            x: isShowingGreeting ? -UIScreen.main.bounds.width / 2 : 0.0,
                            y: 0.0
                        )
                        .animation(greetingAnimation)
                    
                    Rectangle()
                        .fill(Color.red)
                        .offset(
                            x: isShowingGreeting ? UIScreen.main.bounds.width / 2 : 0.0,
                            y: 0.0
                        )
                        .animation(greetingAnimation)
                }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationOptions_Delays {  }

// MARK: - Preview
struct AnimationOptions_Delays_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationOptions_Delays()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
