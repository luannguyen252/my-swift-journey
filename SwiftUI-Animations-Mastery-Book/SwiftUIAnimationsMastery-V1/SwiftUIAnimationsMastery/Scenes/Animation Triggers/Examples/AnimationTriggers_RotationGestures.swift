//
//  AnimationTriggers_RotationGestures.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/24/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_RotationGestures {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let titleText = "Animation Triggers"
    private let subtitleText = "Rotation Gestures"
    private let descriptionText = "Use `RotationGesture` to change an angle of a view and the animation will smooth out the rotation effect."
}

// MARK: - View
extension AnimationTriggers_RotationGestures: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                self.descriptionSection
                    .layoutPriority(2)
                
                Spacer()
                
                GearsView(container: geometry)
                    .foregroundColor(.green)
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_RotationGestures {
}

// MARK: - View Variables
extension AnimationTriggers_RotationGestures {
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
}

// MARK: - Private Helpers
private extension AnimationTriggers_RotationGestures {  }

// MARK: - Preview
struct AnimationTriggers_RotationGestures_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_RotationGestures()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - GearsView
fileprivate struct GearsView {
    private var gearAnimationDuration: TimeInterval = 6.28
    var container: GeometryProxy
    @State private var rotationPercentage: CGFloat = 0.0
    
    public init(
        container: GeometryProxy
    ) {
        self.container = container
    }
}

// MARK: - GearsView: View
extension GearsView: View {
    var body: some View {
        let maxGearSideLength = self.maxGearSideLength
        
        return VStack(spacing: 0) {
            Image(systemName: "gear")
                .resizable()
                .frame(
                    width: maxGearSideLength,
                    height: maxGearSideLength
                )
                .rotationEffect(.radians(.pi * 2.0 * Double(self.rotationPercentage)))
                .gesture(topGearRotationGesture)
            
            Image(systemName: "gear")
                .resizable()
                .frame(
                    width: maxGearSideLength * 0.5,
                    height: maxGearSideLength * 0.5
                )
                .rotationEffect(.radians(-.pi * 2.0 * Double(self.rotationPercentage)))
                .offset(
                    x: maxGearSideLength * (0.5 / 2),
                    y: maxGearSideLength * sin(-.pi / 36)
                )

            Image(systemName: "gear")
                .resizable()
                .frame(
                    width: maxGearSideLength * 0.25,
                    height: maxGearSideLength * 0.25
                )
                .rotationEffect(.radians(.pi * 2.0 * Double(self.rotationPercentage)))
                .offset(
                    x: 0,
                    y: maxGearSideLength * sin(-.pi / 14)
                )
                
        }
//        .onAppear {
//            withAnimation(self.gearAnimation) {
//                self.rotationPercentage += 1.0
//            }
//        }
    }
}

// MARK: - GearsView: Computeds
extension GearsView {
    var maxGearSideLength: CGFloat {
        min(container.size.width, container.size.height) * 0.8
    }
    
    var gearAnimation: Animation {
        Animation
            .linear(duration: gearAnimationDuration)
            .repeatForever(autoreverses: false)
    }
    
    var topGearRotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.rotationPercentage = CGFloat(angle.radians / (2 * .pi))
            }
    }
}
