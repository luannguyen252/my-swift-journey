//
//  Color.swift
//  FundTransferApp2
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

extension Color {
    static let background = Color.init(red: 82/255, green: 82/255, blue: 191/255)
    static let lightPurple = Color.init(red: 93/255, green: 91/255, blue: 198/255)
    static let orangeColor = Color.init(red: 240/255, green: 125/255, blue: 81/255)
    static let purpleGradient = LinearGradient(gradient: Gradient(colors: [background, lightPurple]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
