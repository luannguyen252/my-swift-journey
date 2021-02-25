//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Path_QuadCurve: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedBottomRectangle(curveOffset: 30)
                .fill(Color.purple)
                .frame(height: 120)
                .shadow(radius: 8)
                .overlay(
                    Text("Path")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 40))
                .ignoresSafeArea(edges: .top)
            
            Text("QuadCurve")
                .foregroundColor(.gray)
            
            Text("Here's an example of how you add a curve to your path.")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding()
                .padding(.bottom)
                .background(
                    RoundedBottomRectangle(curveOffset: -30)
                        .fill(Color.purple)
                        .shadow(radius: 4, y: 4))
            Spacer()
        }
        .font(.title)
    }
}

struct Path_QuadCurve_Previews: PreviewProvider {
    static var previews: some View {
        Path_QuadCurve()
    }
}

struct RoundedBottomRectangle: Shape {
    // How far up or down you want the curve to extend
    var curveOffset: CGFloat = 10
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // Add a curve as you draw a line to the next point
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY + curveOffset))
        path.addLine(to: CGPoint(x: 0, y: 0))
        return path
    }
}
