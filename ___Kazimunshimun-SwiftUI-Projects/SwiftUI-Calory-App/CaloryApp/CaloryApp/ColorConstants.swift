//
//  ColorConstants.swift
//  CaloryApp
//
//  Created by Anik on 29/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct ColorConstants{
    static let lightGrayColor = Color(red: 200/255.0, green: 200/255.0, blue: 200/255.0)
    static let appBackgroundColor = Color(red: 247/255.0, green: 247/255.0, blue: 247/255.0)
    static let todayViewGradientColor = LinearGradient (gradient: Gradient(colors: [startColor, endColor]), startPoint: .top, endPoint: .bottom)
    
    static let startColor = Color.init(red: 245/255.0, green: 0, blue: 255/255.0)
    static let endColor = Color.init(red: 1, green: 51/255.0, blue: 82/255.0)
    
    static let greenTextColor = Color.init(red: 69/255.0, green: 199/255.0, blue: 12/255.0)
}
