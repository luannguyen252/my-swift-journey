//
//  GettingStarted_WithAnimationExample.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/4/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit

struct GettingStarted_WithAnimationExample {
    @State private var isCircleOffset = false
}

// MARK: - View
extension GettingStarted_WithAnimationExample: View {
    var body: some View {
        VStack(spacing: 20) {
            descriptionSection
            
            VStack {
                Circle()
                    .fill(Color.pink)
                    .frame(width: 100, height: 100)
                    .offset(circleOffset)
                    .animation(.easeInOut(duration: 0.4))
                
                
                Spacer()
                
                Button(action: {
                    self.isCircleOffset.toggle()
                }) {
                    Text("Animate")
                        .font(.title)
                }
            }
        }
        .padding(.vertical)
    }
}

// MARK: - Computeds
extension GettingStarted_WithAnimationExample {
    var circleOffset: CGSize {
        CGSize(
            width: isCircleOffset ? 0 : 0,
            height: isCircleOffset ? 300 : 0
        )
    }
}

// MARK: - View Variables
extension GettingStarted_WithAnimationExample {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text("Example")
                .textStyle(TitleTextStyle())
            
            Text("Parts of an Animation")
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: "There is just one thing missing. We want to tell SwiftUI to animate the change in the Y position of the circle!")
        }
    }
}

// MARK: - Private Helpers
private extension GettingStarted_WithAnimationExample {
}

// MARK: - Preview
struct GettingStarted_WithAnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_WithAnimationExample()
    }
}
