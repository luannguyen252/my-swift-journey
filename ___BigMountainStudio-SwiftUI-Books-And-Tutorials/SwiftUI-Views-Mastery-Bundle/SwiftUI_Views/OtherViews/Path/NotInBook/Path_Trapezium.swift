//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Path_Trapezium: View {
    @State private var offset: CGFloat = 90.0
    
    var body: some View {
        VStack(spacing: 40.0) {
            Trapezium(offSet: offset, corner: .bottomLeft)
                .fill(Color.purple)
                .frame(height: 200)
                .shadow(radius: 4, y: 4)
                .overlay(
                    Text("Path")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    .padding(.bottom, 30))
            
            HeaderView("", subtitle: "The Trapezium", desc: "Add logic to your shapes to control the path dynamically based on input.",
                       back: .purple, textColor: .white)
            
            Text("Offset")
            Slider(value: $offset, in: 0...200, minimumValueLabel: Text("0"), maximumValueLabel: Text("200"), label: { Text("Offset") })
                .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
        .ignoresSafeArea(edges: .top)
    }
}

struct Path_Trapezium_Previews: PreviewProvider {
    static var previews: some View {
        Path_Trapezium()
    }
}

struct Trapezium: Shape {
    var offSet: CGFloat = 20
    var corner: UIRectCorner = .bottomLeft
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Top Left
        path.move(to: CGPoint(x: 0, y: 0 + abs(corner == .topLeft ? offSet : 0)))
        // Bottom Left
        path.addLine(to: CGPoint(x: 0, y: rect.maxY - abs(corner == .bottomLeft ? offSet : 0)))
        // Bottom Right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - abs(corner == .bottomRight ? offSet : 0)))
        // Top Right
        path.addLine(to: CGPoint(x: rect.maxX, y: 0 + abs(corner == .topRight ? offSet : 0)))
        
        path.closeSubpath()
        
        return path
    }
}
