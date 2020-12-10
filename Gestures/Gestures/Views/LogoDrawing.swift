//
//  LogoDrawing.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

// MARK: - DRAW LOGO
struct LogoDrawing: View {
    var body: some View {
        ZStack {
            IPhoneBorder().fill(Color.greenish)
            IPhoneScreen().fill(Color.blackish)
            Text("{}").font(.system(size: 100, design: .monospaced)).foregroundColor(Color.whiteish)
        }
    }
}

// MARK: - COLOR
extension Color {
    static let greenish = Color(red: 103/255, green: 183/255, blue: 164/255)
    static let whiteish = Color(red: 208/255, green: 208/255, blue: 208/255)
    static let blackish = Color(red: 30/255, green: 32/255, blue: 36/255)
}

// MARK: - IPHONE BORDER
struct IPhoneBorder: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 50))
        path.addQuadCurve(to: CGPoint(x: 50, y: 0), control: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 300, y: 0))
        path.addQuadCurve(to: CGPoint(x: 350, y: 50), control: CGPoint(x: 350, y: 0))
        path.addLine(to: CGPoint(x: 350, y: 600))
        path.addQuadCurve(to: CGPoint(x: 300, y: 650), control: CGPoint(x: 350, y: 650))
        path.addLine(to: CGPoint(x: 50, y: 650))
        path.addQuadCurve(to: CGPoint(x: 0, y: 600), control: CGPoint(x: 0, y: 650))
        path.addLine(to: CGPoint(x: 0, y: 50))
        
        let scale = (rect.width / 350)
        
        return path.applying(CGAffineTransform(scaleX: scale, y: scale))
    }
}

// MARK: - IPHONE SCREEN
struct IPhoneScreen: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 20, y: 50))
        path.addQuadCurve(to: CGPoint(x: 50, y: 20), control: CGPoint(x: 20, y: 20))
        
        path.addLine(to: CGPoint(x: 90, y: 20))
        path.addQuadCurve(to: CGPoint(x: 100, y: 30), control: CGPoint(x: 100, y: 20))
        path.addQuadCurve(to: CGPoint(x: 120, y: 50), control: CGPoint(x: 100, y: 50))
        path.addLine(to: CGPoint(x: 230, y: 50))
        path.addQuadCurve(to: CGPoint(x: 250, y: 30), control: CGPoint(x: 250, y: 50))
        path.addQuadCurve(to: CGPoint(x: 260, y: 20), control: CGPoint(x: 250, y: 20))
        
        path.addLine(to: CGPoint(x: 300, y: 20))
        path.addQuadCurve(to: CGPoint(x: 330, y: 50), control: CGPoint(x: 330, y: 20))
        path.addLine(to: CGPoint(x: 330, y: 600))
        path.addQuadCurve(to: CGPoint(x: 300, y: 630), control: CGPoint(x: 330, y: 630))
        path.addLine(to: CGPoint(x: 50, y: 630))
        path.addQuadCurve(to: CGPoint(x: 20, y: 600), control: CGPoint(x: 20, y: 630))
        path.addLine(to: CGPoint(x: 20, y: 50))
        
        let scale = (rect.width / 350)
        
        return path.applying(CGAffineTransform(scaleX: scale, y: scale))
    }
}

// MARK: - PREVIEW
struct LogoDrawing_Previews: PreviewProvider {
    static var previews: some View {
        LogoDrawing()
    }
}
