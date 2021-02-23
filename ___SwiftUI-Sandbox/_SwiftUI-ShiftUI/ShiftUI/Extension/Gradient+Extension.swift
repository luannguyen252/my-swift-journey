//
//  Gradient+Extension.swift
//  ShiftUI
//
//  Created by Zoha on 2/20/21.
//

import SwiftUI


extension LinearGradient {
  init(_ colors: Color...) {
    self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
  }
}
