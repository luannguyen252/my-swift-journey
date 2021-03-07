//
//  ContentView.swift
//  Drawing
//
//  Created by Nicholas Fox on 1/10/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      // A raw path
      Path { path in
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 100))
      }

      // Shape
      Triangle()
        .fill(Color.red)

      // Stacking Shapes can lead to outlines!
      Triangle()
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

      RawArc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
        .stroke(Color.green, lineWidth: 10)

      Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
        .stroke(Color.orange, lineWidth: 10)
        .frame(width: 200)

    }
    .frame(width: 300, height: 300)


  }
}

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    return path
  }
}


struct RawArc: Shape {
  let startAngle: Angle
  let endAngle: Angle
  let clockwise: Bool

  func path(in rect: CGRect) -> Path {
    var path = Path()

    path.addArc(
      center: CGPoint(x: rect.midX, y: rect.midY),
      radius: rect.width / 2,
      startAngle: startAngle,
      endAngle: endAngle,
      clockwise: clockwise)

    return path
  }

}

struct Arc: InsettableShape {
  let startAngle: Angle
  let endAngle: Angle
  let clockwise: Bool
  var insetAmount: CGFloat = 0

  func path(in rect: CGRect) -> Path {

    let adjustment = Angle.degrees(90)
    var path = Path()

    path.addArc(
      center: CGPoint(x: rect.midX, y: rect.midY),
      radius: (rect.width / 2) - insetAmount,
      startAngle: startAngle - adjustment,
      endAngle: endAngle - adjustment,
      clockwise: !clockwise)

    return path
  }

  func inset(by amount: CGFloat) -> some InsettableShape {
    var arc = self
    arc.insetAmount += amount
    return arc
  }

}


struct InsetContentView: View {
  var body: some View {

    ZStack {
      Circle()
        .strokeBorder(Color.blue, lineWidth: 40)

      Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
        .strokeBorder(Color.orange, lineWidth: 30)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    //ContentView()
    InsetContentView()
  }
}
