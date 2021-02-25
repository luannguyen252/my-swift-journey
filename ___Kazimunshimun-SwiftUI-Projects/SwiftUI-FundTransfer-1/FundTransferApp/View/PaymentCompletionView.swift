//
//  PaymentCompletionView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct PaymentCompletionView: View {
    @Binding var config: PaymentViewConfig
    @ObservedObject var dragDrop: UserDragDrop
    var body: some View {
        ZStack {
            Button(action: {
                config.faceIDSuccess = true
                withAnimation(.linear(duration: 1.5)) {
                    config.startRotationAnimation = true
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 4)
                    
                    Image(systemName: "faceid")
                        .font(.system(size: 102))
                        .opacity(config.faceIDSuccess ? 0.0 : 1.0)
                }
                .rotationEffect(config.startRotationAnimation ? .degrees(240.0) : .degrees(0.0))
                .opacity(config.startRotationAnimation ? 0.0 : 1.0)
                .foregroundColor(.black)
            })
            
            
            Button(action: {
                withAnimation {
                    dragDrop.dragDropConfig.isDroppedOnPayment = false
                }
            }, label: {
                ZStack {
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [2, 34]))
                        .scaleEffect(config.startRotationAnimation ? 1.4 : 1.2)
                        .rotationEffect(config.startRotationAnimation ? .degrees(0.0) : .degrees(-360.0))
                        .opacity(config.startRotationAnimation ? 0.0 : 1.0)
                    
                    Circle()
                        .stroke(lineWidth: 4)
                    
                    CheckmarkShape()
                        .trim(from: 0.0, to: config.startRotationAnimation ? 1.0 : 0.0)
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                }
                .foregroundColor(.black)
            })
            .opacity(config.startRotationAnimation ? 1.0 : 0.0)
            
        }
        .frame(width: config.showCreditCard ? 100 : 0.0,
               height: config.showCreditCard ? 100 : 0.0)
        .opacity(config.showCreditCard ? 1.0 : 0.0)
    }
}
