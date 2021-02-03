//
//  Extensions.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 14/09/20.
//

import SwiftUI



extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static let backgroudColor = UIColor.rgb(red: 25, green: 25, blue: 25)
    static let mainBlueTint = UIColor.rgb(red: 17, green: 154, blue: 237)
    static let outlineStrokeColor = UIColor.rgb(red: 234, green: 46, blue: 111)
    static let trackStrokeColor = UIColor.rgb(red: 56, green: 25, blue: 49)
    static let pulsatingFillColor = UIColor.rgb(red: 86, green: 30, blue: 63)
    static let dominantNavy = UIColor.rgb(red: 38,green: 44,blue: 92)
    static let darkpink = UIColor.rgb(red: 171,green: 32,blue: 107)
    static let lightPurple = UIColor.rgb(red: 136,green: 36,blue: 100)
    static let darkPurple = UIColor.rgb(red: 72,green: 43,blue: 95)
    static let pastelPink = UIColor.rgb(red: 224,green: 148,blue: 188)
    static let funPink = UIColor.rgb(red: 226,green: 25,blue: 111)
    static let twitterBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
    
    static let googleGray = UIColor.rgb(red: 218, green: 219, blue: 223)
    static let googleLabelGray = UIColor.rgb(red: 98, green: 98, blue: 98)
    
    static let greenSea = UIColor.rgb(red: 22, green: 160, blue: 133)
    static let pomegranate = UIColor.rgb(red: 192, green: 57, blue: 43)
    static let pumpkin = UIColor.rgb(red: 211, green: 84, blue: 0)
}


extension View {
  func statusBar(style: UIStatusBarStyle) -> some View {
    preference(key: StatusBarStyleKey.self, value: style)
  }
}
