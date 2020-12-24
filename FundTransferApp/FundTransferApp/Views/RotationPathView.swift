//
//  RotationPathView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct RotationPathView: View {
    // MARK: - PROPERTIES
    @Binding var isRotating: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .square, dash: [8]))
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .square, dash: [8]))
                .frame(width: 170, height: 170)
                .rotationEffect(.degrees(isRotating ? -360 : 0))
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .square, dash: [8]))
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
        } //: ZSTACK
        .animation(Animation.linear(duration: 10.0).repeatForever(autoreverses: false))
        .opacity(0.5)
    }
}
