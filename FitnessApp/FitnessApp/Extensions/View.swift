//
//  View.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

extension View {
    func invertedRectangleNeomorphify(topBlur: CGFloat = 3,
                                      bottomBlur: CGFloat = 6,
                                      cornerRadius: CGFloat = 10,
                                      topOffset: CGFloat = 3,
                                      bottomOffset: CGFloat = -2) -> some View {
        self.modifier(NeomorphicRectangleInverted(topBlur: topBlur, bottomBlur: bottomBlur, cornerRadius: cornerRadius, topOffset: topOffset, bottomOffset: bottomOffset))
    }
    
    func invertedRectangleMiddleNeomorphify() -> some View {
        self.modifier(NeomorphicRectangleInvertedTopBottom())
    }
}
