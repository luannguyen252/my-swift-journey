//
//  NeumorphicEffect.swift
//  SinglePass
//
//  Created by Juan Francisco Dorado Torres on 28/10/20.
//

import SwiftUI

struct NeumorphicEffect: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: Color.darkShadow, radius: 10, x: 9, y: 9)
      .shadow(color: Color.lightShadow, radius: 10, x: -9, y: -9)
  }
}

extension View {
  func neumorphic() -> some View {
    return self.modifier(NeumorphicEffect())
  }
}
