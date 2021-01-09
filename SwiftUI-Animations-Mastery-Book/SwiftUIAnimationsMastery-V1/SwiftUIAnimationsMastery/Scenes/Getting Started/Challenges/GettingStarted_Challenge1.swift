//
//  GettingStarted_Challenge1.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/6/20.
// ✌️
//

import SwiftUI

struct GettingStarted_Challenge1 {
    private var animationDuration: Double = 0.54
    @State private var isCircleOffset = false
}

// MARK: - View
extension GettingStarted_Challenge1: View {
    var body: some View {
        VStack(spacing: 30) {
            descriptionSection
                .layoutPriority(1)

            GeometryReader { geometry in
                ExampleCircle(container: geometry, isOffset: self.isCircleOffset)
            }
            .padding()
            
            Button(action: {
                withAnimation(
                    Animation.easeInOut(duration: self.animationDuration))
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
extension GettingStarted_Challenge1 {
}

// MARK: - View Variables
extension GettingStarted_Challenge1 {
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
    var diameter: CGFloat = 60
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
            width: isOffset ? (container.size.width - diameter) : 0,
            height: isOffset ? (container.size.height - diameter) : 0
        )
    }
}

// MARK: - Preview
struct GettingStarted_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GettingStarted_Challenge1()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
