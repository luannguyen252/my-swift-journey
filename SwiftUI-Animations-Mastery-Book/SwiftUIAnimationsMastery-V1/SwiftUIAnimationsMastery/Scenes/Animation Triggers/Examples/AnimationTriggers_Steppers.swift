//
//  AnimationTriggers_Steppers.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/16/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_Steppers {
    private var animationDuration: Double = 0.38

    private let titleText = "Animation Triggers"
    private let subtitleText = "Steppers"
    private let descriptionText = "The stepper increments and decrements values which can be applied to a number of modifiers and then animated."

    @State private var bubblePhase: Int = 1
}

// MARK: - View
extension AnimationTriggers_Steppers: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)
            
            bubbleDisplay
                .animation(self.sliderAnimation)
            
            
            Stepper(value: $bubblePhase, in: 1...4) {
                HStack {
                    Text("Bubble Phase")
                    Spacer()
                    Text("\(bubblePhase)")
                }
            }
            .padding()
        }
        .navigationBarTitle("")
    }
}

// MARK: - Computeds
extension AnimationTriggers_Steppers {
    var sliderAnimation: Animation {
        .easeOut(duration: animationDuration)
    }
}

// MARK: - View Variables
extension AnimationTriggers_Steppers {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: descriptionText, textColor: .black, backgroundColor: .green)
        }
    }
    
    private var bubbleDisplay: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(1...60, id: \.self) { number in
                    Circle()
                        .fill(Color.purple)
                        .opacity(0.2 * Double(self.bubblePhase))
                        .frame(
                            width: self.circleDiameter(in: geometry),
                            height: self.circleDiameter(in: geometry)
                        )
                        .position(self.circlePosition(in: geometry))
                }
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_Steppers {
    func circleDiameter(in geometry: GeometryProxy) -> CGFloat {
        let maxSize: CGFloat = max(geometry.size.width, geometry.size.height) / 2.0
        
        return maxSize / CGFloat.random(in: 1...20)
    }
    
    func circlePosition(in geometry: GeometryProxy) -> CGPoint {
        .init(
            x: CGFloat.random(in: 0 ..< geometry.size.width),
            y: CGFloat.random(in: 0 ..< geometry.size.height)
        )
    }
}

// MARK: - Preview
struct AnimationTriggers_Steppers_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_Steppers()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
