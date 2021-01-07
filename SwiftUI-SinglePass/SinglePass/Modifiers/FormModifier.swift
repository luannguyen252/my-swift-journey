//
//  FormModifier.swift
//  SinglePass
//
//  Created by Juan Francisco Dorado Torres on 28/10/20.
//

import SwiftUI

struct FormModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .background(Color.background)
      .cornerRadius(10)
      .padding()
      .neumorphic()
  }
}
