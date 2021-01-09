//
//  GettingStarted_NoAnimationExample.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/4/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit

struct GettingStarted_NoAnimationExample {
    @State private var isCircleOffset = false
}

// MARK: - View
extension GettingStarted_NoAnimationExample: View {
    var body: some View {
        VStack(spacing: 20) {
            descriptionSection
            
            VStack {
                Circle()
                    .fill(Color.pink)
                    .frame(width: 100, height: 100)
                    .offset(circleOffset)
                
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
extension GettingStarted_NoAnimationExample {
    var circleOffset: CGSize {
        CGSize(
            width: isCircleOffset ? 0 : 0,
            height: isCircleOffset ? 300 : 0
        )
    }
}

// MARK: - View Variables
extension GettingStarted_NoAnimationExample {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text("Example")
                .textStyle(TitleTextStyle())
            
            Text("Parts of an Animation")
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: "The button changes a variable that then changes a view's property. That property change causes a change on the screen.")
        }
    }
}

// MARK: - Private Helpers
private extension GettingStarted_NoAnimationExample {
}

// MARK: - Preview
struct GettingStarted_NoAnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_NoAnimationExample()
    }
}
