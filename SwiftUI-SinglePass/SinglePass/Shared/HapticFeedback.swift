//
//  HapticFeedback.swift
//  SinglePass
//
//  Created by Juan Francisco Dorado Torres on 28/10/20.
//

import SwiftUI

enum HapticFeedback {
  public static func generate() {
    let generator = UIImpactFeedbackGenerator(style: .light)
    generator.prepare()
    generator.impactOccurred()
  }
}
