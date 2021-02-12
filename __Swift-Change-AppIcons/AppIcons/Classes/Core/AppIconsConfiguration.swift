//
//  AppIconsConfiguration.swift
//  AppIcons
//
//  Created by Ross Butler on 26/03/2020.
//

import Foundation
import CoreGraphics

public struct AppIconsConfiguration {
    let cornerRadius: CGFloat?
    let primaryIconName: String
    let primaryIconFileName: String?
    
    public init(cornerRadius: CGFloat? = nil, primaryIconName: String? = nil,
                primaryIconFileName: String? = nil) {
        self.cornerRadius = cornerRadius
        self.primaryIconName = primaryIconName ?? "Default"
        self.primaryIconFileName = primaryIconFileName
    }
}
