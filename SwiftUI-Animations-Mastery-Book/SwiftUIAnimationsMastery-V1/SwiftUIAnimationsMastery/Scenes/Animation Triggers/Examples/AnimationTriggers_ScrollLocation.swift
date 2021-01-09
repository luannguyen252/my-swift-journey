//
//  AnimationTriggers_ScrollLocation.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/26/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_ScrollLocation {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let titleText = "Animation Triggers"
    private let subtitleText = "ScrollView"
    private let descriptionText = "Although no animation modifier is used, the ScrollView is changing values (locations of views) that you can use to modify views. Here is a parallax effect as an example:"
}

// MARK: - View
extension AnimationTriggers_ScrollLocation: View {
    var body: some View {
        VStack(spacing: 12) {
            self.descriptionSection
                .layoutPriority(2)
            
            self.cardsListSection
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_ScrollLocation {
}

// MARK: - View Variables
extension AnimationTriggers_ScrollLocation {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(
                text: descriptionText,
                textColor: .primary,
                backgroundColor: .purple,
                font: horizontalSizeClass == .regular ? .largeTitle : .title
            )
        }
    }

    private var cardsListSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    GeometryReader { geometry in
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .offset(x: 0, y: -geometry.frame(in: .global).origin.y * 0.725)
                    }
                    
                    self.cardsList
                        .padding(40)
                }
                .edgesIgnoringSafeArea(.vertical)
        }
    }

    private var cardsList: some View {
        VStack(spacing: 40) {
            ForEach(1...10, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.6)
                    .frame(height: 200)
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_ScrollLocation {
}

// MARK: - Preview
struct AnimationTriggers_ScrollLocation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_ScrollLocation()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
