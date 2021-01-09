//
//  ProgressBarView.swift
//  SwiftUIAnimationsMastery
//
// Created by Brian Sipple on 5/29/20.
// Copyright © 2020 CypherPoet. All rights reserved.
//

import SwiftUI

struct ProgressBarView {
    var progress: CGFloat
    var barWidth: CGFloat = 10
    var trackColor: Color = Color(.systemGray5)
    var fillColor: Color = .accentColor
}

// MARK: - Computeds
extension ProgressBarView {
    var strokeStyle: StrokeStyle { .init(lineWidth: barWidth, lineCap: .round) }
}

// MARK: - `View` Body
extension ProgressBarView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Capsule()
                    .stroke(self.trackColor, style: self.strokeStyle)
                    .frame(width: self.barWidth / 2)

                Capsule()
                    .stroke(self.fillColor, style: self.strokeStyle)
                    .frame(width: self.barWidth / 2, height: geometry.size.height * self.progress)
            }
        }
    }
}

// MARK: - View Variables
private extension ProgressBarView {  }

// MARK: - Private Helpers
private extension ProgressBarView {  }

// MARK: - Preview
struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 22) {
            ProgressBarView(progress: 0.0)
            ProgressBarView(progress: 0.333)
            ProgressBarView(progress: 0.5)
            ProgressBarView(progress: 0.667)
            ProgressBarView(progress: 1.0)
        }
    }
}
