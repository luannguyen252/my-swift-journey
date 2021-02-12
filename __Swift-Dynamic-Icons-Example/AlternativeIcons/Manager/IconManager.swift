//
//  IconManager.swift
//  AlternativeIcons
//
//  Created by Ting Becker on 2/5/21.
//

import UIKit

class IconManager {
    
    let application = UIApplication.shared
    
    // same naming convention in the plist to refernce to actual files
    enum AppIcon: String {
        case charmanderIcon
        case pikachuIcon
    }
    
    func changeAppIcon(to appIcon: AppIcon) {
        application.setAlternateIconName(appIcon.rawValue)
    }
    
}
