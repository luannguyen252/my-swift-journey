//
//  GradientButtonStyle.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 03/12/2020.
//

import SwiftUI

struct GradientButtonStyle: ViewModifier {

  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity)
      .padding()
      .foregroundColor(.white)
      .background(LinearGradient(gradient:
                                  Gradient(colors: [Color.gradientStart, Color.gradientEnd]),
                                 startPoint: .leading, endPoint: .trailing))
      .cornerRadius(10)
      .padding(.horizontal, 20)
  }
}

extension Text {
  func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
    ModifiedContent(content: self, modifier: style)
  }
}
