//
//  AnimationTriggers_LongPressGestures.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/17/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_LongPressGestures {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var buttonScaleAnimationDuration: TimeInterval = 0.40
    private var rippleAnimationDuration: TimeInterval = 0.70

    private let titleText = "Animation Triggers"
    private let subtitleText = "Long-Press Gestures"
    private let descriptionText = "You can start an animation with a long press gesture."

    private let longPressDuration: TimeInterval = 1.0
    
    @GestureState private var longPressState: LongPressState = .inactive
    @State private var didCompleteLongPress = false
    @State private var isShowingRipple = false

    
    @State private var circleSpinRotation: Double = 0.0
    @State private var circleScale: CGFloat = 1.0
    @State private var rippleOpacity: Double = 1.0
}

// MARK: - View
extension AnimationTriggers_LongPressGestures: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 22) {
                self.descriptionSection
                    .layoutPriority(1)
                
                Spacer()
                
                VStack(spacing: 42) {
                    VStack(spacing: 10) {
                        Text("LongPress State: \(self.longPressState == .inactive ? "Inactive" : "Detecting")")
                        Text("didCompleteLongPress: \(self.didCompleteLongPress ? "True" : "False")")
                    }
                    .font(.headline)

                    self.circleGroup
                        .frame(
                            width: (self.horizontalSizeClass == .compact ? geometry.size.width : geometry.size.height) * 0.5,
                            height: (self.horizontalSizeClass == .compact ? geometry.size.width : geometry.size.height) * 0.5
                        )
                        .gesture(self.circleLongPressGesture)
                        .padding(.bottom)
                }

                Spacer()
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_LongPressGestures {
    var circleSpinAnimation: Animation {
        Animation
            .linear(duration: longPressDuration)
            .repeatForever()
    }
    
    var circleBounceAnimation: Animation {
        Animation.timingCurve(0.3, 0.2, 0.87, 4.4, duration: buttonScaleAnimationDuration)
    }
    
    var buttonFillAnimation: Animation {
        .easeInOut(duration: buttonScaleAnimationDuration)
    }
    
    var rippleAnimation: Animation {
        .easeOut(duration: rippleAnimationDuration)
    }
    
    var circleLongPressGesture: some Gesture {
        LongPressGesture(minimumDuration: longPressDuration, maximumDistance: .infinity)
            .updating($longPressState) { isDetecting, longPressState, _ in
                print("longPressState Update value: \(isDetecting)")
                longPressState = .detecting
            }
            .onChanged { isDetecting in
                print("LongPressGesture change value: \(isDetecting)")
            }
            .onEnded { finished in
                print("didCompleteLongPress: \(finished)")
                
                self.didCompleteLongPress = finished
                self.isShowingRipple = true
                self.circleScale = 0.86
                
                withAnimation(self.circleBounceAnimation) {
                    self.circleScale = 1.0
                }
            }
    }
}

// MARK: - View Variables
extension AnimationTriggers_LongPressGestures {
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
    
    private var rippleCircle: some View {
        Circle()
            .fill(Color.blue)
            .opacity(rippleOpacity)
            .animation(.easeOut(duration: rippleAnimationDuration))
            .transition(
                    .asymmetric(
                        insertion: AnyTransition
                            .fadeOut
                            .combined(with: AnyTransition.scaleUp(to: 12))
                            .animation(rippleAnimation),
                        removal: AnyTransition
                            .opacity
                    )
            )
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.rippleAnimationDuration) {
                    self.isShowingRipple = false
                    self.rippleOpacity = 0
                }
            }
    }

    private var circleBorderOverlay: some View {
        let strokeStyle = StrokeStyle(
            lineWidth: 15,
            lineCap: .square,
            dash: [30, 30],
            dashPhase: 1.0
        )
        
        return Group {
            if longPressState == .detecting {
                Circle()
                    .strokeBorder(Color.secondary, style: strokeStyle)
                    .animation(nil)
                    .rotationEffect(.radians(circleSpinRotation))
                    .animation(circleSpinAnimation)
                    .onAppear {
                        self.circleSpinRotation = 2.0 * .pi
                    }
                    .onDisappear {
                        self.circleSpinRotation = 0.0
                    }
            } else {
                Circle()
                    .strokeBorder(didCompleteLongPress ? Color.blue : Color.secondary, style: strokeStyle)
            }
        }
        .blendMode(.plusLighter)
    }
    
    private var circleGroup: some View {
        ZStack {
            if isShowingRipple {
                rippleCircle
                    .onDisappear {
                        self.rippleOpacity = 1
                    }
            }
            
            Circle()
                .fill(didCompleteLongPress ? Color.blue : Color.gray)
                .animation(buttonFillAnimation)
                .scaleEffect(circleScale)
                .overlay(circleBorderOverlay)
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_LongPressGestures {
    enum LongPressState {
        case inactive
        case detecting
    }
}

// MARK: - Preview
struct AnimationTriggers_LongPressGestures_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_LongPressGestures()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
