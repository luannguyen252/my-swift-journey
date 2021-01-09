//
//  ProgressRingView.swift
//  SwiftUIAnimationsMastery
//
// Created by Brian Sipple on 5/28/20.
// Copyright © 2020 CypherPoet. All rights reserved.
//

import SwiftUI

struct ProgressRingView {
    var progress: CGFloat
    var strokeWidth: CGFloat = 10
    var trackColor: Color = Color(.systemGray5)
    var fillColor: Color = .accentColor
}

// MARK: - Computeds
extension ProgressRingView {
    var strokeStyle: StrokeStyle { .init(lineWidth: strokeWidth, lineCap: .round) }
}

// MARK: - `View` Body
extension ProgressRingView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(trackColor, style: strokeStyle)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(fillColor, style: strokeStyle)
                .rotationEffect(.radians(-.pi / 2))
        }
    }
}

// MARK: - View Variables
private extension ProgressRingView {  }

// MARK: - Private Helpers
private extension ProgressRingView {  }

// MARK: - Preview
struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProgressRingView(progress: 0.0)
            ProgressRingView(progress: 0.333)
            ProgressRingView(progress: 0.5)
            ProgressRingView(progress: 0.667)
            ProgressRingView(progress: 1.0)
        }
    }
}
