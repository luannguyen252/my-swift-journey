//
//  AnimationScope_WithAnimation_MultipleViews.swift
//  SwiftUIAnimationsMastery
//
// Created by Brian Sipple on 5/26/20.
// Copyright © 2020 CypherPoet. All rights reserved.
//

import SwiftUI

struct AnimationScope_WithAnimation_MultipleViews {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private let titleText = "withAnimation Function"
    private let subtitleText = "Multiple View"
    private let descriptionText1 = "Any value changed within the withAnimation closure will animate the view that uses that value in its modifiers. This value can exist anywhere in the view hierarchy and affect many views."

    private let colorAnimationDuration: TimeInterval = 0.3
    private let boxAnimationDuration: TimeInterval = 0.7

    @State private var isBoxOpen = false
    @State private var isBoxUnlocked = false
}

// MARK: - View
extension AnimationScope_WithAnimation_MultipleViews: View {
    var body: some View {
        VStack(spacing: 20) {
            descriptionSection
                .fixedSize(horizontal: false, vertical: true)

            unlockButton
                .padding(.vertical)
                .frame(height: 44)

            catInTheBox
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationScope_WithAnimation_MultipleViews {
    var colorAnimation: Animation { .easeOut(duration: colorAnimationDuration) }
    var boxAnimation: Animation { .easeOut(duration: boxAnimationDuration) }

    var boxColor: Color {
        Color(isBoxUnlocked ? .systemGray2 : .systemPink)
    }
}

// MARK: - View Variables
private extension AnimationScope_WithAnimation_MultipleViews {
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

    var unlockButton: some View {
        Button(
            action: {
                withAnimation(self.colorAnimation) {
                    self.isBoxUnlocked.toggle()
                }
            },
            label: {
                Image(systemName: isBoxUnlocked ? "lock.open" : "lock")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(height: 60)
            }
        )
    }

    var catInTheBox: some View {
        GeometryReader { geometry in
            ZStack {
                Image("cat-peeking")
                    .resizable()
                    .scaledToFit()

                HStack(spacing: 0) {
                    Rectangle()
                        .fill(self.boxColor)
                        .offset(x: self.isBoxOpen ? -geometry.size.width / 2 : 0)

                    Rectangle()
                        .fill(self.boxColor)
                        .offset(x: self.isBoxOpen ? geometry.size.width / 2 : 0)
                }
            }
            .allowsHitTesting(self.isBoxUnlocked)
            .onTapGesture {
                withAnimation(self.boxAnimation) {
                    self.isBoxOpen.toggle()
                }
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationScope_WithAnimation_MultipleViews {  }

// MARK: - Preview
struct AnimationScope_WithAnimation_MultipleViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationScope_WithAnimation_MultipleViews()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .colorScheme(.dark)
    }
}
