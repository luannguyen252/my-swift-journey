//
//  ButtonStyleProperties.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 08/10/2020.
//

import SwiftUI

protocol ButtonStyleProperties {
    var verticalPadding: CGFloat { get }
    var horizontalPadding: CGFloat { get }
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
    var cornerRadius: CGFloat { get }
    var font: Font { get }
    var isEnabled: Bool { get }
}

extension ButtonStyleProperties {
    var cornerRadius: CGFloat { 25.0 }
    var font: Font { Font.body.bold() }
}

// Get state
struct GetButtonStyleProperties: ButtonStyleProperties {
    
    private var isDownloaded: Bool
    
    init(isDownloaded: Bool) {
        self.isDownloaded = isDownloaded
        self.verticalPadding = isDownloaded ? 0 : 5
        self.horizontalPadding = 20
        self.foregroundColor = isDownloaded ? .blue : .white
        self.backgroundColor = isDownloaded ? .clear : .blue
        self.isEnabled = true
    }
    
    var verticalPadding: CGFloat
    var horizontalPadding: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color
    var isEnabled: Bool
}

// Preparing to download state
struct PreparingToDownloadButtonStyleProperties: ButtonStyleProperties {
    var verticalPadding: CGFloat = 0
    var horizontalPadding: CGFloat = 0
    var foregroundColor: Color = Color.gray.opacity(0.5)
    var backgroundColor: Color = .clear
    var isEnabled: Bool = false
}

// Downloading state
struct DownloadingButtonStyleProperties: ButtonStyleProperties {
    var verticalPadding: CGFloat = 0
    var horizontalPadding: CGFloat = 0
    var foregroundColor: Color = .blue
    var backgroundColor: Color = .clear
    var isEnabled: Bool = false
}

// Downloaded
struct DownloadedButtonStyleProperties: ButtonStyleProperties {
    var verticalPadding: CGFloat = 0
    var horizontalPadding: CGFloat = 20
    var foregroundColor: Color = .clear
    var backgroundColor: Color = .blue
    var isEnabled: Bool = false
}

// Open
struct OpenButtonStyleProperties: ButtonStyleProperties {
    var verticalPadding: CGFloat = 5
    var horizontalPadding: CGFloat = 20
    var foregroundColor: Color = Color.white
    var backgroundColor: Color = Color.blue
    var isEnabled: Bool = true
}
