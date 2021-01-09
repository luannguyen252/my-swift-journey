//
//  AnimationOptions_TurningOnOff_WatchingValues.swift
//  SwiftUIAnimationsMastery
//
// Created by Brian Sipple on 5/31/20.
// Copyright © 2020 CypherPoet. All rights reserved.
//

import SwiftUI

struct AnimationOptions_TurningOnOff_WatchingValues {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private let titleText = "Animation Activation"
    private let subtitleText = "Watching Values"
    private let descriptionText1 = """
    The first parameter for the animation modifier is the Animation itself.
    The second parameter is an optional 'value'.
    When you change this value, the animation takes effect.
    If it doesn't change since the last animation, then there will be no animation.
    It HAS to change for the animation to happen.
    """

    @State private var isAnimationEligible: Bool = false
    @State private var isAnimationActive: Bool = false
}

// MARK: - Static Helpers
extension AnimationOptions_TurningOnOff_WatchingValues {
    static let shapeAnimationDuration: TimeInterval = 0.32
    static let shapeAnimation = Animation
        .easeOut(duration: Self.shapeAnimationDuration)
}

// MARK: - Computeds
extension AnimationOptions_TurningOnOff_WatchingValues {
    var offsetMultiplier: CGFloat { isAnimationActive ? 1.0 : 0.0 }
}

// MARK: - View
extension AnimationOptions_TurningOnOff_WatchingValues: View {
    var body: some View {
        VStack(spacing: 20) {
            descriptionSection
                .fixedSize(horizontal: false, vertical: true)

            VStack(spacing: 10) {
                AnimationToggleButton(title: "Tap Twice to Animate") {
                    self.isAnimationEligible.toggle()

                    if self.isAnimationEligible {
                        self.isAnimationActive.toggle()
                    }
                }

                Spacer()

                GeometryReader { geometry in
                    HStack {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 100, height: 100)
                            .offset(x: (geometry.size.width - 100) * self.offsetMultiplier)
                            .animation(Self.shapeAnimation, value: self.isAnimationActive)

                        Spacer()
                    }
                }

                Spacer()
            }
            .padding(.vertical)
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - View Variables
private extension AnimationOptions_TurningOnOff_WatchingValues {
    var descriptionSection: some View {
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
}

// MARK: - Private Helpers
private extension AnimationOptions_TurningOnOff_WatchingValues {  }

// MARK: - Preview
struct AnimationOptions_TurningOnOff_WatchingValues_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationOptions_TurningOnOff_WatchingValues()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .colorScheme(.dark)
    }
}
