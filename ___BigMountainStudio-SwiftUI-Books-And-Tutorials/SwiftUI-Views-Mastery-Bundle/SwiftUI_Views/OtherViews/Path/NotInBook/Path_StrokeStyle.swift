//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Path_StrokeStyle: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Path",
                       subtitle: "StrokeStyle",
                       desc: "Use StrokeStyle to customize your strokes.", back: .purple, textColor: .white)
                .layoutPriority(1)
            
            HLine()
                .stroke(Color.purple, style: StrokeStyle(lineWidth: 10))
            
            Group {
                Text("dash").font(.body)
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [20]))
                
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [20, 10]))
                
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [20, 10, 15, 5, 30, 10]))
            }.frame(height: 10)
            
            Group {
                Text("lineCap").font(.body)
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [20]))
                
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [20]))
                
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, lineCap: .square, dash: [20]))
            }.frame(height: 10)
            
            Text("lineJoin").font(.body)
            HStack(spacing: 50.0) {
                Corner()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 20, lineJoin: CGLineJoin.bevel))
                
                Corner()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 20, lineJoin: CGLineJoin.miter))
                
                Corner()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 20, lineJoin: CGLineJoin.round))
            }.frame(height: 40).padding(.horizontal, 50)
            
            Text("miterLimit").font(.body)
            HStack(spacing: 50.0) {
                Spear()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, miterLimit: 1))
                
                Spear()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, miterLimit: 10))
            }.frame(height: 40).padding(.horizontal, 50)
            
            Group {
                Text("dashPhase").font(.body)
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [50], dashPhase: 0))
                
                HLine()
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [50], dashPhase: 15))
            }.frame(height: 10)
        }
        .font(.title)
    }
}

struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        }
    }
}

struct Corner: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
    }
}

struct Spear: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        }
    }
}

struct Path_StrokeStyle_Previews: PreviewProvider {
    static var previews: some View {
        Path_StrokeStyle()
    }
}
