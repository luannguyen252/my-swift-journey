//
//  AnimationOptions_LongDurationParameter.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/7/20.
// ✌️
//

import SwiftUI
import AnimatableGradients

struct AnimationOptions_LongDurationParameter {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let titleText = "Animation Options"
    private let subtitleText = "Long Durations"
    private let descriptionText1 = "Sometimes you want a very long duration to create subtle effects on your UI."
    
    @State private var animationCompletion: CGFloat = 0.0
}

// MARK: - View
extension AnimationOptions_LongDurationParameter: View {
    var body: some View {
        VStack(spacing: 20) {
            descriptionSection
                .layoutPriority(2)
                
            Group {
                gradient1
                    // .frame(maxWidth: .infinity)
            }
            .edgesIgnoringSafeArea(.all)
            .padding()
            .padding()
            
            Spacer()
        }
        .onAppear {
            withAnimation(
                Animation
                    .linear(duration: 5.0)
                    .repeatForever(autoreverses: true)
            ) {
                self.animationCompletion = 1.0
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationOptions_LongDurationParameter {  }

// MARK: - View Variables
extension AnimationOptions_LongDurationParameter {
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
    
    private var gradient1: some View {
        Color.clear
            .animatableLinearGradient(
                baseShape: RoundedRectangle(cornerRadius: 22),
                startColors: [.systemBlue, .systemPink, .white],
                endColors: [.systemPurple, .lightGray, .systemGreen],
                startPoint: .bottomLeading,
                endPoint: .trailing,
                completionPercentage: animationCompletion
            )
    }

//    private var gradient1: some View {
//        LinearGradient(
//            gradient: Gradient(
//                stops: [
//                    .init(color: .red, location: 0.0),
//                    .init(color: .blue, location: 0.5),
//                ]
////                colors: [
////                    .yellow,
////                ]
//            ),
//            startPoint: UnitPoint(
//                x: -4.0 + (animationCompletion * 4.0),
//                y: 0.5
//            ),
//            endPoint: UnitPoint(
//                x: 4.0,
//                y: 0.5
//            )
//        )
//    }
}

// MARK: - Private Helpers
private extension AnimationOptions_LongDurationParameter {  }

// MARK: - Preview
struct AnimationOptions_LongDurationParameter_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationOptions_LongDurationParameter()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
