//
//  AnimationScope_WithAnimation_Sequencing.swift
//  SwiftUIAnimationsMastery
//
// Created by Brian Sipple on 5/26/20.
// Copyright © 2020 CypherPoet. All rights reserved.
//

import SwiftUI

struct AnimationScope_WithAnimation_Sequencing {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private let titleText = "withAnimation Function"
    private let subtitleText = "Timing & Sequencing"
    private let descriptionText1 = ""

    private let lineWidth: CGFloat = 10.0
    private let microDelayDuration: TimeInterval = 0.12
    private let yesColor = Color.green
    private let noColor = Color.red

    @State private var decisionState: DecisionState = .inactive
    @State private var decisionProgress: CGFloat = 0.0
    @State private var lineReachingProgress: CGFloat = 0.0
    @State private var textBounceScale: CGFloat = 1.0
}

// MARK: - Static Helpers
extension AnimationScope_WithAnimation_Sequencing {
    static let buttonSpinAnimationDuration: TimeInterval = 1.4
    static let lineReachAnimationDuration: TimeInterval = 0.5685
    static let textBounceAnimationDuration: TimeInterval = 0.63

    static let buttonSpinAnimation = Animation
        .linear(duration: buttonSpinAnimationDuration)


    static let lineReachAnimation = Animation
        .easeOut(duration: lineReachAnimationDuration)


    static let textBounceAnimation = Animation
        .easeOut(duration: Self.textBounceAnimationDuration)
}

// MARK: - Computeds
extension AnimationScope_WithAnimation_Sequencing {
    var isShowingLineToYes: Bool {
        [.reachedYes, .reachingToYes].contains(decisionState)
    }

    var isShowingLineToNo: Bool {
        [.reachedNo, .reachingToNo].contains(decisionState)
    }

    var yesTextColor: Color {
        decisionState == .reachedYes ? yesColor : .gray
    }

    var noTextColor: Color {
        decisionState == .reachedNo ? noColor : .gray
    }

    var decisionButtonTextColor: Color {
        switch decisionState {
        case .deciding,
             .inactive:
            return .accentColor
        case .reachedYes,
             .reachingToYes:
            return yesColor
        case .reachedNo,
             .reachingToNo:
            return noColor
        }
    }

    var decisionRingSize: CGFloat {
        min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 0.33
    }
}

// MARK: - View
extension AnimationScope_WithAnimation_Sequencing: View {
    var body: some View {
//        VStack(spacing: 20) {
//            descriptionSection
//                .fixedSize(horizontal: false, vertical: true)
//
//            VStack(spacing: 10) {
//                yesSection
//                decisionButtonSection
//                noSection
//            }
//            .padding(.bottom)
//        }
        VStack(spacing: 10) {
            yesSection
            decisionButtonSection
            noSection
        }
        .padding(.vertical)
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - View Variables
private extension AnimationScope_WithAnimation_Sequencing {
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
    
    var decisionButtonSection: some View {
        ZStack {
            decisionButton
            decisionLoaderRing
        }
        .frame(width: decisionRingSize, height: decisionRingSize)
    }

    var decisionLoaderRing: some View {
        ProgressRingView(
            progress: decisionProgress,
            strokeWidth: lineWidth * 1.5,
            fillColor: decisionButtonTextColor
        )
        .hueRotation(.radians(2.0 * .pi * Double(decisionProgress)))
    }
    
    var decisionButton: some View {
        Button(action: makeDecision) {
//            Image(systemName: "questionmark")
//                .resizable()
//                .scaledToFill()
            Text("?")
                .font(.system(size: 60))
                .hueRotation(.radians(2.0 * .pi * Double(decisionProgress)))
                .foregroundColor(decisionButtonTextColor)
                .padding(5)
        }
        .background(Color.clear)
        .clipShape(Circle())
    }

    var yesSection: some View {
        VStack(spacing: 20) {
            VStack(spacing: 15) {
                Text("YES")
                    .scaledSystemFont(size: 64, weight: .semibold, design: .rounded)
                    .foregroundColor(yesTextColor)
                    .scaleEffect(decisionState == .reachedYes ? textBounceScale : 1.0)
                    .animation(Self.textBounceAnimation)
                
                ProgressBarView(
                    progress: lineReachingProgress,
                    barWidth: lineWidth * 0.7,
                    trackColor: .clear,
                    fillColor: yesColor
                )
                .opacity(isShowingLineToYes ? 1.0 : 0.0)
            }

            Spacer()
        }
    }

    var noSection: some View {
        VStack(spacing: 20) {
            Spacer()

            VStack(spacing: 15) {
                ProgressBarView(
                    progress: lineReachingProgress,
                    barWidth: lineWidth * 0.7,
                    trackColor: .clear,
                    fillColor: noColor
                )
                .rotationEffect(.radians(.pi))
                .opacity(isShowingLineToNo ? 1.0 : 0.0)
                
                Text("NO")
                    .scaledSystemFont(size: 64, weight: .semibold, design: .rounded)
                    .foregroundColor(noTextColor)
                    .scaleEffect(decisionState == .reachedNo ? textBounceScale : 1.0)
                    .animation(Self.textBounceAnimation)
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationScope_WithAnimation_Sequencing {
    func makeDecision() {
        let decisionValue = Int.random(in: 0...1)

        self.decisionState = .deciding
        self.decisionProgress = 0.0
        self.lineReachingProgress = 0.0

        withAnimation(Self.buttonSpinAnimation) {
            self.decisionProgress = 1.0
        }

        DispatchQueue.main.asyncAfter(
            deadline: .now() +
                Self.buttonSpinAnimationDuration +
                microDelayDuration * 2.2
        ) {
            withAnimation(Self.lineReachAnimation) {
                self.decisionState = decisionValue == 1 ? .reachingToYes : .reachingToNo
                self.lineReachingProgress = 1.0
            }
        }

        // 📝 For some reason, an animation delay isn't enough to prevent the text color
        // from instantly changing here. (Xcode 11.5, MacOS 10.15.4)
//        withAnimation(
//            Self
//                .textBounceAnimation
//                .delay(
//                    Self.buttonSpinAnimationDuration +
//                    Self.lineReachAnimationDuration
//                )
//        ) {
//            self.decisionState = decisionValue == 1 ? .reachedYes : .reachedNo
//            self.textBounceScale = 1.3
//        }
//
//        withAnimation(
//            Self
//                .textBounceAnimation
//                .delay(
//                    Self.buttonSpinAnimationDuration +
//                    Self.lineReachAnimationDuration +
//                    Self.textBounceAnimationDuration
//                )
//        ) {
//            self.textBounceScale = 1.0
//        }

        DispatchQueue.main.asyncAfter(
            deadline: .now() +
                Self.buttonSpinAnimationDuration +
                microDelayDuration +
                Self.lineReachAnimationDuration +
                microDelayDuration
        ) {
            withAnimation(Self.textBounceAnimation) {
                self.decisionState = decisionValue == 1 ? .reachedYes : .reachedNo
                self.textBounceScale = 1.93
            }
            withAnimation {
                self.textBounceScale = 1.0
            }
        }
    }
}

// MARK: - DecisionState
private extension AnimationScope_WithAnimation_Sequencing {
    enum DecisionState {
        case inactive
        case deciding
        case reachingToYes
        case reachedYes
        case reachingToNo
        case reachedNo
    }
}

// MARK: - Preview
struct AnimationScope_WithAnimation_Sequencing_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationScope_WithAnimation_Sequencing()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .colorScheme(.dark)
    }
}
