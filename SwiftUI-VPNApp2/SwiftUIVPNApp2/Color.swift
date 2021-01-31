//
//  Color.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

extension Color {
    static let appPrimary = Color.init(red: 17/255, green: 17/255, blue: 17/255)
    static let dropDown = Color.init(red: 24/255, green: 24/255, blue: 24/255)
    static let progressBackground = Color.init(red: 164/255, green: 24/255, blue: 250/255, opacity: 0.25)
    static let progress = Color.init(red: 164/255, green: 24/255, blue: 250/255)
    static let crownBackground = Color.init(red: 24/255, green: 24/255, blue: 24/255)
    static let darkPurple = Color.init(red: 169/255, green: 41/255, blue: 246/255)
    static let viewTop = Color.init(red: 187/255, green: 68/255, blue: 251/255)
    static let viewBottom = Color.init(red: 104/255, green: 36/255, blue: 242/255)
    static let startColor = Color.init(red: 164/255, green: 24/255, blue: 250/255)
    static let stopColor = Color.init(red: 255/255, green: 217/255, blue: 26/255)
    static let greenDot = Color.init(red: 0/255, green: 255/255, blue: 102/255)
    static let grayDot = Color.init(red: 137/255, green: 137/255, blue: 137/255)
    
    static let progressLinear = LinearGradient(
        gradient: Gradient(colors:
                            [Color.progress,
                             Color.progress.opacity(0.01)]),
        startPoint: .leading,
        endPoint: .trailing)
    
    static let progressBackgroundLinear = LinearGradient(
        gradient: Gradient(colors:
                            [Color.progressBackground,
                             Color.progressBackground.opacity(0.01)]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let sideBackground = LinearGradient(gradient: Gradient(colors: [Color.viewTop, Color.viewBottom]), startPoint: .top, endPoint: .bottom)
}
