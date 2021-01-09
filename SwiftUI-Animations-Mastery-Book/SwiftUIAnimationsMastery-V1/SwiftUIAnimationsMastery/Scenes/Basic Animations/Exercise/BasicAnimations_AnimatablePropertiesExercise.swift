//
//  BasicAnimations_AnimatablePropertiesExercise.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/9/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_AnimatablePropertiesExercise {
    private let titleText = "Putting It All Together"
    private let subtitleText = "End Result"
    private let descriptionText = ""

    private let animationDuration: Double = 0.638
    
    private let rectangleWidthPct: CGFloat = 0.1
    private let rectangleHeightPct: CGFloat = 0.025
    
    @State private var isShowingGraphic = false
}

// MARK: - View
extension BasicAnimations_AnimatablePropertiesExercise: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(2)
            
            GeometryReader { geometry in
                self.rectangleComposition(in: geometry)
            }
            
            animationToggleButton
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension BasicAnimations_AnimatablePropertiesExercise {
}

// MARK: - View Variables
extension BasicAnimations_AnimatablePropertiesExercise {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            // BannerTextView(text: descriptionText)
        }
    }
    
    func xOffset(for rectNumber: Int, in geometry: GeometryProxy) -> CGFloat {
        guard isShowingGraphic == false else { return 0.0 }
        
        switch rectNumber {
        case 1,
             3:
            return -1 * geometry.size.width
        case 2,
             4:
            return 1 * geometry.size.width
        default:
            preconditionFailure()
        }
    }
    
    func yOffset(for rectNumber: Int, in geometry: GeometryProxy) -> CGFloat {
        guard isShowingGraphic == false else { return 0.0 }
        
        switch rectNumber {
        case 1,
             2:
            return -1 * geometry.size.height
        case 3,
             4:
            return 1 * geometry.size.height
        default:
            preconditionFailure()
        }
    }
    
    private func rectangleComposition(in geometry: GeometryProxy) -> some View {
        let width = geometry.size.width * rectangleWidthPct
        let height = geometry.size.height * rectangleHeightPct
        let opacity = isShowingGraphic ? 1.0 : 0.0
        let fillColor: Color = isShowingGraphic ? .pink : .purple
        
        return ZStack {
            ForEach(1...4, id: \.self) { rectNumber in
                Rectangle()
                    .fill(fillColor)
                    .frame(width: width, height: height)
                    .padding(0.5)
                    .rotationEffect(
                        .radians(
                            self.isShowingGraphic ? .pi * 0.5 * Double(rectNumber) : 0.0
                        ),
                        anchor: .bottomTrailing
                    )
                    .offset(
                        x: self.xOffset(for: rectNumber, in: geometry) - (width / 2),
                        y: self.yOffset(for: rectNumber, in: geometry) + (height / 2)
                    )
            }
        }
        .opacity(opacity)
        .frame(width: geometry.size.width, height: geometry.size.height)
    }
    
    private var animationToggleButton: some View {
        Button(action: {
            withAnimation(
                Animation.easeInOut(duration: self.animationDuration)
            ) {
                self.isShowingGraphic.toggle()
            }
        }) {
            Text("Animate ⚡️")
                .font(.title)
        }
    }
}

// MARK: - Private Helpers
private extension BasicAnimations_AnimatablePropertiesExercise {
}

// MARK: - Preview
struct BasicAnimations_AnimatablePropertiesExercise_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BasicAnimations_AnimatablePropertiesExercise()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
