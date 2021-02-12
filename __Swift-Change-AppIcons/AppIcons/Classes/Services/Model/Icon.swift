//
//  AppIcon.swift
//  AppIcons
//
//  Created by Ross Butler on 19/12/2019.
//

import Foundation
import UIKit

public struct Icon {
    
    var cornerRadius: CGFloat?
    public let iconName: String
    public let fileName: String?
    public let isPrimary: Bool
    
    init(iconName: String, fileName: String?, isPrimary: Bool = false) {
        self.iconName = iconName
        self.fileName = fileName
        self.isPrimary = isPrimary
    }
    
    var image: UIImage? {
        guard let fileName = self.fileName else {
            return nil
        }
        return UIImage(named: fileName)
    }
    
}
