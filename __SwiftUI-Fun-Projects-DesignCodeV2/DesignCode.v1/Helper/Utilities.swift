//
//  Utilities.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 10/31/20.
//

import SwiftUI

struct DoubleShadowCustom: ViewModifier {
    
    var firstOpacityPercentage: Double
    var firstRadius: CGFloat
    var firstX: CGFloat
    var firstY: CGFloat
    var secondOpacityPercentage: Double
    var secondRadius: CGFloat
    var secondX: CGFloat
    var secondY: CGFloat
    
    func body(content: Content) -> some View{
        content
            .shadow(color: Color.black.opacity(firstOpacityPercentage), radius: firstRadius, x: firstX, y: firstY)
            .shadow(color: Color.black.opacity(secondOpacityPercentage), radius: secondRadius, x: secondX, y: secondY)
    }
}


struct DoubleShadowFixed: ViewModifier {
    
    func body(content: Content) -> some View{
        content
            .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}


struct FontModifier: ViewModifier{
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
      content
        
        .font(.system(style, design: .rounded))
    }
}


struct CustomeFontModifier: ViewModifier{
    var size: CGFloat = 28
    
    func body(content: Content) -> some View{
        content
            .font(.custom("Dosis-Light", size: size))
        
    }
}


