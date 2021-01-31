//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Curve1: Shape {
    var yOffset: CGFloat = 40
    // Value between 0 and 1
    var xOffsetPercent: CGFloat = 0.5 // Looks ugly. Don't do.
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - yOffset))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - yOffset),
                          control: CGPoint(x: rect.maxX * xOffsetPercent, y: rect.maxY + yOffset))
        path.closeSubpath()
        return path
    }
}

struct Curve1_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            //            Curve1(yOffset: 60, xOffsetPercent: -1)
            //                .fill(Color.purple)
            //                .frame(height: 200)
            //                .opacity(0.8)
            //                .border(Color.red)
            
            Curve1(yOffset: 60, xOffsetPercent: 1.9)
                .fill(Color.purple)
                .frame(height: 200)
                .opacity(0.8)
                .border(Color.red)
            
            Image("vishnu.r.nair")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipShape(Curve1())
                .overlay(
                    Text("Concert!")
                        .font(.system(size: 80, weight: .black))
                        .foregroundColor(.white)
                        .opacity(0.5))
                .shadow(radius: 8, y: 8)
        }
    }
}

