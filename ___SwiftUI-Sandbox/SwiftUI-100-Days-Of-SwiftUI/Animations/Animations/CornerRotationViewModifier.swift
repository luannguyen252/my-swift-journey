//
//  CornerRotationViewModifier.swift
//  Animations
//
//  Created by Nicholas Fox on 12/28/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import Foundation
import SwiftUI


struct CornerRotateModifier: ViewModifier {
  let amount: Double
  let anchor: UnitPoint

  func body(content: Content) -> some View {
    content
      .rotationEffect(.degrees(amount), anchor: anchor)
      .clipped()
  }
}


extension AnyTransition {
  static var pivot: AnyTransition {
    .modifier(
      active: CornerRotateModifier(amount: -90, anchor: .topLeading),
      identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
    )
  }
}
