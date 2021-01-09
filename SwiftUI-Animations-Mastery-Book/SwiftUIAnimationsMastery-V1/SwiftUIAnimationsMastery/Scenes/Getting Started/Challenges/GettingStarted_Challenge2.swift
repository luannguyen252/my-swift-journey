//
//  GettingStarted_Challenge2.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/6/20.
// ✌️
//

import SwiftUI

struct GettingStarted_Challenge2 {
    private var animationDuration: Double = 0.254
    @State private var isCircleOffset = false
}

// MARK: - View
extension GettingStarted_Challenge2: View {
    var body: some View {
        VStack(spacing: 30) {
            descriptionSection
                .layoutPriority(1)

            GeometryReader { geometry in
                VStack {
                    ExampleCircle(container: geometry, isOffset: self.isCircleOffset)
                    Spacer()
                }
            }
            .padding()
            
            Button(action: {
                withAnimation(
                    Animation.linear(duration: self.animationDuration))
                {
                    self.isCircleOffset.toggle()
                }
            }) {
                Text("Animate ⚡️")
                    .font(.title)
            }
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension GettingStarted_Challenge2 {
}

// MARK: - View Variables
extension GettingStarted_Challenge2 {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text("Challenge")
                .textStyle(TitleTextStyle())
            
            Text("Move the Circle Shape")
                .textStyle(SubtitleTextStyle())
        }
    }
}

// MARK: - ExampleCircle
private struct ExampleCircle {
    var container: GeometryProxy
    var isOffset: Bool
    var diameter: CGFloat = 100
}

extension ExampleCircle: View {
    var body: some View {
        Circle()
            .fill(Color.pink)
            .frame(width: diameter, height: diameter)
            .offset(self.circleOffset)
    }
}

private extension ExampleCircle {
    var circleOffset: CGSize {
        CGSize(
            width: 0,
            height: isOffset ? (container.size.height - diameter) : 0
        )
    }
}

// MARK: - Preview
struct GettingStarted_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GettingStarted_Challenge2()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
