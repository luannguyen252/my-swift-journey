//
//  ColorConstants.swift
//  StepCounter
//
//  Created by Anik on 18/8/20.
//

import SwiftUI

struct ColorConstants {
    static let topColor1        = Color.init(red: 31/255, green: 15/255, blue: 119/255)
    static let topColor2        = Color.init(red: 12/255, green: 39/255, blue: 186/255)
    static let bottomColor1     = Color.init(red: 100/255, green: 24/255, blue: 131/255)
    static let bottomColor2     = Color.init(red: 221/255, green: 19/255, blue: 130/255)
    
    static let backgroundGradient = Gradient(
        colors: [bottomColor1, bottomColor2, topColor1, topColor2])
}
