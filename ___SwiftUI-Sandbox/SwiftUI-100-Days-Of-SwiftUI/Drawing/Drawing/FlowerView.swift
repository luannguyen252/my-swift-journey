//
//  FlowerView.swift
//  Drawing
//
//  Created by Nicholas Fox on 1/26/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI


struct Flower: Shape {

  var petalOffset: Double = -20
  var petalWidth: Double = 100
  var petalCount: Int = 16

  private var step: CGFloat {
    return (2 * CGFloat.pi) / CGFloat(petalCount)
  }

  func path(in rect: CGRect) -> Path {
    var path = Path()

    // Count from 0 up to pi * 2, moving up pi / 8 each time
    for number in stride(from: 0, to: CGFloat.pi * 2, by: step) {
      let rotation = CGAffineTransform(rotationAngle: number)
      let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
      let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
      let rotatedPetal = originalPetal.applying(position)
      path.addPath(rotatedPetal)
    }
    return path
  }
}


struct FlowerView: View {

  @State private var petalOffset = -20.0
  @State private var petalWidth = 100.0
  @State private var petalCount = 16

  var body: some View {
    VStack {
      Flower(petalOffset: petalOffset, petalWidth: petalWidth, petalCount: petalCount)
       // .stroke(Color.red, lineWidth: 1)
        .fill(Color.red, style: FillStyle(eoFill: true))
      Text("Offset")
      Slider(value: $petalOffset, in: -40...40)
        .padding([.horizontal, .bottom])
      Text("Width")
      Slider(value: $petalWidth, in: 0...100)
        .padding([.horizontal, .bottom])
      Text("Petals")
      Stepper.init(value: $petalCount, in: 1...32, label: { Text("\(petalCount)") })
    }
  }
}

struct FlowerView_Previews: PreviewProvider {
  static var previews: some View {
    FlowerView()
  }
}
