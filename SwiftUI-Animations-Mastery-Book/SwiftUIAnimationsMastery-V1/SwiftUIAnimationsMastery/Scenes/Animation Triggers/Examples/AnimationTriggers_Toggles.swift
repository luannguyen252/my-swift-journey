//
//  AnimationTriggers_Toggles.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/16/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_Toggles {
    private var animationDuration: Double = 0.38

    private let titleText = "Animation Triggers"
    private let subtitleText = "Toggles"
    private let descriptionText = "The toggle can also be used to trigger animations. Maybe you want to enable or show options."

    @State private var optionsAreEnabled = false
}

// MARK: - View
extension AnimationTriggers_Toggles: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(1)
            
            VStack(spacing: 12) {
                Toggle(isOn: $optionsAreEnabled) {
                    Text("Extra Options")
                        .font(.headline)
                }
                
                optionsDisplay
                    .opacity(optionsAreEnabled ? 1.0 : 0.4)
                    .animation(optionsAnimation)
                    .allowsHitTesting(optionsAreEnabled)
            }
            .padding()
        }
        .navigationBarTitle("")
    }
}

// MARK: - Computeds
extension AnimationTriggers_Toggles {
    var optionsAnimation: Animation {
        .easeOut(duration: animationDuration)
    }
}

// MARK: - View Variables
extension AnimationTriggers_Toggles {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: descriptionText, textColor: .black, backgroundColor: .green)
        }
    }
    
    private var optionsDisplay: some View {
        VStack {
            Image(systemName: "hammer.fill")
            Text("Moar Options")
            
            Slider(value: .constant(4))
        }
        .padding()
        .padding(.vertical)
        .background(Color.green)
        .cornerRadius(12)
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_Toggles {
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
struct AnimationTriggers_Toggles_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_Toggles()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
