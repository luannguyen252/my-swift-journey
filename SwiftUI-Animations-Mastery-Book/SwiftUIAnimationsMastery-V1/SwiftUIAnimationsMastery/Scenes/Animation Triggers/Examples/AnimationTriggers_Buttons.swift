//
//  AnimationTriggers_Buttons.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_Buttons {
    private var animationDuration: Double = 0.38

    private let titleText = "Animation Triggers"
    private let subtitleText = "Buttons"
    private let descriptionText = "Animation can be triggered by the action of a button tap."
    
    @State private var controlsAreExpanded = false
}

// MARK: - View
extension AnimationTriggers_Buttons: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 22) {
                descriptionSection
                    .layoutPriority(2)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    controlPanel
                }
            }
            .padding()
        }
        .navigationBarTitle("")
    }
}

// MARK: - Computeds
extension AnimationTriggers_Buttons {
    var controlsToggleAnimation: Animation {
        if controlsAreExpanded {
            return Animation.easeIn(duration: animationDuration)
        } else {
            return Animation.spring(
                response: animationDuration,
                dampingFraction: 0.53,
                blendDuration: 0.0
            )
        }
    }
}

// MARK: - View Variables
extension AnimationTriggers_Buttons {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: descriptionText, backgroundColor: .green)
        }
    }
    
    private var controlPanel: some View {
        let buttonAngles: [Angle] = [
            .radians(.pi * (12 / 24)),
            .radians(.pi * (17.5 / 24)),
            .radians(.pi * (23 / 24)),
        ]
        
        let buttonImages: [Image] = [
            .init(systemName: "bag.badge.plus"),
            .init(systemName: "gauge.badge.plus"),
            .init(systemName: "calendar.badge.plus"),
        ]
        
        return ZStack {
            animationToggleButton
            
            ForEach(Array(zip(buttonAngles, buttonImages)), id: \.0) { (angle, image) in
                Button(action: {}) {
                    // 📝 This could definitely be encapsulated in its own style.
                    image
                        .resizable()
                        .padding()
                        .frame(width: 50, height: 50)
                        .font(.title)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                    .disabled(self.controlsAreExpanded == false)
                    .opacity(self.controlsAreExpanded ? 1 : 0)
                    .offset(
                        x: (self.controlsAreExpanded ? 100 : 0) * cos(CGFloat(angle.radians)),
                        y: (self.controlsAreExpanded ? -100 : 0) * sin(CGFloat(angle.radians))
                    )
            }
        }
    }
    
    private var animationToggleButton: some View {
        Button(action: {
            withAnimation(self.controlsToggleAnimation) {
                self.controlsAreExpanded.toggle()
            }
        }) {
            Image(systemName: "plus")
                .resizable()
                .padding()
                .frame(width: 50, height: 50)
                .font(.title)
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_Buttons {  }

// MARK: - Preview
struct AnimationTriggers_Buttons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_Buttons()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
