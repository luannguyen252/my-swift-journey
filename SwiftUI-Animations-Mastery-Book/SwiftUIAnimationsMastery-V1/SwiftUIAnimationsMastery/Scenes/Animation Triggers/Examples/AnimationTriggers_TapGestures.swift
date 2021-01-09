//
//  AnimationTriggers_TapGestures.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/20/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_TapGestures {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var buttonAnimationDuration: TimeInterval = 0.28

    private let titleText = "Animation Triggers"
    private let subtitleText = "Tap Gestures"
    private let descriptionText = "A la buttons, you can respond to tap (and multiple-tap) gestures to animate UI changes."

    @State private var isCircleActive = false
}

// MARK: - View
extension AnimationTriggers_TapGestures: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                self.descriptionSection
                    .layoutPriority(2)
                
                Spacer()
                
                VStack(spacing: 50) {
                    VStack(spacing: 20) {
                        Text("Double-Tap")
                            .fontWeight(.semibold)
                        
                        self.tappingCircle
                            .frame(
                                width: self.buttonDiameter(in: geometry),
                                height: self.buttonDiameter(in: geometry)
                            )
                            .shadow(
                                color: self.isCircleActive ? Color.green : Color.red,
                                radius: self.buttonDiameter(in: geometry) * 0.15,
                                x: 0.0,
                                y: 0.0
                            )
                            .onTapGesture(count: 2) { self.isCircleActive.toggle() }
                    }
                    
                    VStack(spacing: 20) {
                        Text("Triple-Tap")
                            .fontWeight(.semibold)
                        
                        self.tappingCircle
                            .frame(
                                width: self.buttonDiameter(in: geometry),
                                height: self.buttonDiameter(in: geometry)
                            )
                            .shadow(
                                color: self.isCircleActive ? Color.green : Color.red,
                                radius: self.buttonDiameter(in: geometry) * 0.15,
                                x: 0.0,
                                y: 0.0
                            )
                            .onTapGesture(count: 3) { self.isCircleActive.toggle() }
                    }
                }
                .font(.title)

                Spacer()
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_TapGestures {  }

// MARK: - View Variables
extension AnimationTriggers_TapGestures {
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
                font: horizontalSizeClass == .regular ? .title : .headline
            )
        }
    }
    
    private var tappingCircle: some View {
        Circle()
            .fill(isCircleActive ? Color.green : Color.red)
            .animation(.easeInOut(duration: buttonAnimationDuration))
            .overlay(
                Text("ON")
                    .fontWeight(.medium)
                    .opacity(isCircleActive ? 1 : 0)
            )
            .overlay(
                 Text("OFF")
                     .fontWeight(.medium)
                     .opacity(isCircleActive ? 0 : 1)
             )
            .animation(.easeOut(duration: buttonAnimationDuration))
            .font(.title)
            .foregroundColor(.white)
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_TapGestures {
    func buttonDiameter(in geometry: GeometryProxy) -> CGFloat {
        (
            self.horizontalSizeClass == .compact ? geometry.size.width : geometry.size.height
        )
        * 0.4
    }
}

// MARK: - Preview
struct AnimationTriggers_TapGestures_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_TapGestures()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
