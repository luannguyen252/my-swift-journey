//
//  Utilities.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 10/31/20.
//

import SwiftUI

struct applyOuterDoubleShadow: ViewModifier{
    @Binding var press: Bool
    func body(content: Content) -> some View{
        content
        // 2 drop shadows
        // bottom right dark shadow: #A3B1C6
            .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.6392156863, green: 0.6941176471, blue: 0.7764705882, alpha: 1) ), radius: 20, x: 20, y: 20)
        // top left light shadow: #FFFFFF
            .shadow(color: Color(press ? #colorLiteral(red: 0.6392156863, green: 0.6941176471, blue: 0.7764705882, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
    }
}


//struct applyInnerDoubleShadow: ViewModifier{
//    func body(content: Content) -> some View{
//        content
//
//    }
//}

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


struct Utilities_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


