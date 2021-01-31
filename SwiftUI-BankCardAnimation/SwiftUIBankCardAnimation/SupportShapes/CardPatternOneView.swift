//
//  CardPatternOneView.swift
//  SwiftUIBankCardAnimation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// MARK: - CARD PATTERN
struct CardPatternOneView: Shape {
    func path(in rect: CGRect) -> Path {
        let cX: CGFloat  = rect.midX
        let cY: CGFloat = rect.midY
        
        var path = Path()
        path.move(to: CGPoint(x: cX - 140, y: cY))
        
        path.addCurve(to: CGPoint(x: cX + 160 , y: cY + 150), control1: CGPoint(x: cX + 10, y: cY - 150), control2: CGPoint(x: cX + 150 , y: cY))
        path.closeSubpath()
        
        return path
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CardPatternOneView_Previews: PreviewProvider {
    static var previews: some View {
        CardPatternOneView()
    }
}
#endif
