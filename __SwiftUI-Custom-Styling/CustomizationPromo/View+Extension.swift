//
//  View+Extension.swift
//  CustomizationPromo
//
//  Created by Stewart Lynch on 2020-12-13.
//

import SwiftUI

// Conditional View Modifier extension courtesy of
// https://fivestars.blog/swiftui/conditional-modifiers.html

extension View {
  @ViewBuilder
  func `if`<Transform: View>( _ condition: Bool, transform: (Self) -> Transform) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
