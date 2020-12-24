//
//  NeomorphicRectangleInverted.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct NeomorphicRectangleInverted: ViewModifier {
    let topBlur: CGFloat
    let bottomBlur: CGFloat
    let cornerRadius: CGFloat
    let topOffset: CGFloat
    let bottomOffset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black, lineWidth: 2)
                    .cornerRadius(cornerRadius)
                    .blur(radius: topBlur)
                    .offset(x: topOffset, y: topOffset)
                    .mask(RoundedRectangle(cornerRadius: cornerRadius))
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(ColorConstants.whiteClearWithStopLinear, lineWidth: 2)
                    .blur(radius: bottomBlur)
                    .offset(x: bottomOffset, y: bottomOffset)
                    .mask(RoundedRectangle(cornerRadius: cornerRadius))
            )
    }
}
