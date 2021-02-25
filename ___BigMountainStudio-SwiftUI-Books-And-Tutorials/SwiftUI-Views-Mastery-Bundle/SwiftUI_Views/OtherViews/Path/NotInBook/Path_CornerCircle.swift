//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Path_CornerCircle: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            ZStack(alignment: .topLeading) {
                CornerCircle(corner: .topLeft)
                    .fill(Color(UIColor.systemBackground).opacity(0.2))
                .frame(width: 250, height: 170)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .ignoresSafeArea(edges: .top)
            
            VStack(spacing: 20) {
                Text("Path")
                    .font(.largeTitle)
                
                Text("Corner Semi-Circles")
                
                Text("Use custom shapes to create UI accents like these corner shapes.")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.bottom)
                    .background(Color.purple.opacity(0.5))
                
                Spacer()
                
                ZStack(alignment: .bottomLeading) {
                    CornerCircle(controlPoint: 0.5)
                        .fill(Color(UIColor.systemBackground).opacity(0.1))
                        .frame(width: 100, height: 300)
                    CornerCircle()
                        .fill(Color(UIColor.systemBackground).opacity(0.2))
                        .frame(width: 200, height: 200)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .ignoresSafeArea(edges: .bottom)
            .font(.title)
        }
    }
}

struct Path_CornerCircle_Previews: PreviewProvider {
    static var previews: some View {
        Path_CornerCircle()
//            .preferredColorScheme(.dark)
    }
}

/**
 Creates a quarter of a circle.
 
 Parameters:
 - corner: Which corner you want the shape to appear in.
 - offsetPercent: Use a value between 0 and 1. 1 = Perfectly round (Default)
 
 */
struct CornerCircle: Shape {
    
    var corner: UIRectCorner = .bottomLeft
    var controlPoint: CGFloat = 1
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        
        switch corner {
        case .bottomLeft:
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addQuadCurve(to: .zero,
                              control: CGPoint(x: rect.maxX, y: 0.01 * controlPoint))
        case .topLeft:
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.maxY, y: 0),
                              control: CGPoint(x: rect.maxX * 0.7, y: rect.maxY))
        default:
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        }
        
        return path
    }
}
