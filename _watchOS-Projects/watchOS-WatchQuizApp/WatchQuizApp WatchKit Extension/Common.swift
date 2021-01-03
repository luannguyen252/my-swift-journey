//
//  Common.swift
//  WatchQuizApp WatchKit Extension
//
//  Created by Gualtiero Frigerio on 10/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import SwiftUI

class CommonUtility {
    class func colorFromString(colorString:String) -> Color {
        var colorStr = colorString
        if colorStr.hasPrefix("#") {
            colorStr = colorStr.replacingOccurrences(of: "#", with: "")
        }
        if colorStr.count != 6 {
            return Color.white
        }
        var start = colorStr.index(colorStr.startIndex, offsetBy: 0)
        var end = colorStr.index(colorStr.startIndex, offsetBy: 2)
        let red = String(colorStr[start..<end])
        start = end
        end = colorStr.index(colorStr.endIndex, offsetBy: -2)
        let green = String(colorStr[start..<end])
        start = end
        end = colorStr.index(colorStr.endIndex, offsetBy: 0)
        let blue = String(colorStr[start..<end])
        
        var redValue:UInt64 = 0
        var scanner = Scanner(string: red)
        scanner.scanHexInt64(&redValue)
        var greenValue:UInt64 = 0
        scanner = Scanner(string: green)
        scanner.scanHexInt64(&greenValue)
        var blueValue:UInt64 = 0
        scanner = Scanner(string: blue)
        scanner.scanHexInt64(&blueValue)
        
        return Color.init(red: Double(redValue) / 255.0, green: Double(greenValue) / 255.0, blue: Double(blueValue) / 255.0)
    }
}
