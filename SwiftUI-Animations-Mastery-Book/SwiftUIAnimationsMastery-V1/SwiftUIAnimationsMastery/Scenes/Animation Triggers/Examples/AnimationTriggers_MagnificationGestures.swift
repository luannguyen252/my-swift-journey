//
//  AnimationTriggers_MagnificationGestures.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/21/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_MagnificationGestures {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var imageMagnificationDuration: TimeInterval = 0.28

    private let titleText = "Animation Triggers"
    private let subtitleText = "Magnification Gestures"
    private let descriptionText = "Animation can smooth out the magnification of views."
    
    @State private var magnificationEndScale: CGFloat = 0.0
    @GestureState private var magnificationGestureScale: CGFloat = 1.0
}

// MARK: - View
extension AnimationTriggers_MagnificationGestures: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                self.descriptionSection
                    .layoutPriority(2)
                
                Spacer()
                
                VStack {
                    Text("Zoom In 🔎")
                        .font(.largeTitle)
                        
                    Spacer()
                    
                    Image("castle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .gesture(self.mainImageGesture)
                        .scaleEffect(self.magnificationEndScale + self.magnificationGestureScale, anchor: .center)
                        .animation(.easeOut(duration: self.imageMagnificationDuration))
                    
                    Spacer()
                }
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_MagnificationGestures {
    var mainImageGesture: some Gesture {
        MagnificationGesture()
            .updating($magnificationGestureScale) { (newScale, magnificationGestureScale, _) in
                print("New Scale: \(newScale.magnitude)")
                magnificationGestureScale = newScale.magnitude
            }
            .onEnded { endScale in
                print("End Scale: \(endScale.magnitude)")
                self.magnificationEndScale = endScale.magnitude + self.magnificationGestureScale
            }
    }
}

// MARK: - View Variables
extension AnimationTriggers_MagnificationGestures {
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
private extension AnimationTriggers_MagnificationGestures {  }

// MARK: - Preview
struct AnimationTriggers_MagnificationGestures_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_MagnificationGestures()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
