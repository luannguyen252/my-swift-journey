//
//  PolygonSidesAnimationView.swift
//  SwiftUICoolAnimationTransition
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct PolygonSidesAnimationView: View {
    @State private var sides: Double = 4
    @State private var scale: Double = 1.0

    var body: some View {
        VStack {
            PolygonShape(sides: sides, scale: scale)
                .stroke(Color.pink, lineWidth: (sides < 3) ? 10 : ( sides < 7 ? 5 : 2))
                .padding(20)
                .animation(.easeInOut(duration: 3.0))
                .layoutPriority(1)

            Text("\(Int(sides)) sides, \(String(format: "%.2f", scale as Double)) scale")

            HStack(spacing: 20) {
                Text("\(Int(sides)) sides")
                Slider(value: $sides, in: 0...30)
            }

            HStack(spacing: 20) {
                Text("\(String(format: "%.2f", scale as Double)) scale")
                Slider(value: $scale, in: 0...1.6)
            }

            HStack(spacing: 20) {
                Spacer()
                
                Button(action: {
                    self.sides = Double.random(in: 1...30)
                    self.scale = Double.random(in: 0...1.6)
                }, label: {
                    Text("Random")
                })
                
                Spacer()
            }
        }
        .padding()
        .navigationBarTitle("Polygon Shapes")
    }
}

struct PolygonShape: Shape {
    var sides: Double
    var scale: Double

    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(sides, scale) }
        set {
            sides = newValue.first
            scale = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        // Hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0 * scale

        // Center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)

        var path = Path()

        let extra: Int = sides != Double(Int(sides)) ? 1 : 0

        var vertex: [CGPoint] = []

        for i in 0..<Int(sides) + extra {
            let angle = (Double(i) * (360.0 / sides)) * (Double.pi / 180)

            // Calculate vertex
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))

            vertex.append(pt)

            if i == 0 {
                path.move(to: pt) // Move to first vertex
            } else {
                path.addLine(to: pt) // Draw line to next vertex
            }
        }

        path.closeSubpath()

        // Draw vertex-to-vertex lines
        drawVertexLines(path: &path, vertex: vertex, n: 0)

        return path
    }

    func drawVertexLines(path: inout Path, vertex: [CGPoint], n: Int) {
        if (vertex.count - n) < 3 { return }

        for i in (n+2)..<min(n + (vertex.count-1), vertex.count) {
            path.move(to: vertex[n])
            path.addLine(to: vertex[i])
        }

        drawVertexLines(path: &path, vertex: vertex, n: n+1)
    }
}

struct PolygonSidesAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PolygonSidesAnimationView()
        }
    }
}
