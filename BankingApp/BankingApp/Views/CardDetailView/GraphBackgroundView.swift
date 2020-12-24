//
//  GraphBackgroundView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct GraphBackgroundView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack {
                ForEach (0..<3) { _ in
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 0.3, dash: [5]))
                        .frame(height: 0.5)
                    
                    Spacer()
                }
            } //: VSTACK

            Line()
                .stroke(lineWidth: 0.5)
                .frame(height: 0.5)
        } //: VSTACK
        .foregroundColor(ColorConstants.secondary)
    }
}

// MARK: - LINE SHAPE
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
