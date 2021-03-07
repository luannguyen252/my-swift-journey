//
//  DrawingGroupView.swift
//  Drawing
//
//  Created by Nicholas Fox on 1/26/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ColorCyclingCircle: View {

  var amount = 0.0
  var steps = 100

  var body: some View {
    ZStack {
      ForEach(0..<steps) { value in
        Circle()
          .inset(by: CGFloat(value))
          .strokeBorder(LinearGradient(gradient: Gradient(colors: [
              self.color(for: value, brightness: 1),
              self.color(for: value, brightness: 0.5),
          ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
      }
    }
    .drawingGroup()
  }

  func color(for value: Int, brightness: Double) -> Color {
    var targetHue = Double(value) / Double(self.steps) + self.amount
    if targetHue > 1 {
      targetHue -= 1
    }
    return Color(hue: targetHue, saturation: 1, brightness: brightness)
  }
}

struct DrawingGroupView: View {

  @State private var colorCycle = 0.0

  var body: some View {
    VStack {
      ColorCyclingCircle(amount: self.colorCycle)
        .frame(width: 300, height: 300)
      Slider(value: $colorCycle)
    }
  }
}

struct DrawingGroupView_Previews: PreviewProvider {
  static var previews: some View {
    DrawingGroupView()
  }
}
