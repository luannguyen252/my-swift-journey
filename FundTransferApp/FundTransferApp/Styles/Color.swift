//
//  Color.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

extension Color {
    static let background = Color.init(red: 1, green: 246/255, blue: 1)
    static let cardStart = Color.init(red: 11/255, green: 19/255, blue: 2/255)
    static let cardEnd = Color.init(red: 48/255, green: 53/255, blue: 27/255)
    static let cardLinear = LinearGradient(
        gradient: Gradient(colors: [cardStart, cardEnd]),
        startPoint: .leading,
        endPoint: .trailing)
    static let logoLinear = LinearGradient(
        gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.black]),
        startPoint: .bottomLeading,
        endPoint: .top)
}
