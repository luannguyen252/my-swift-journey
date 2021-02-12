//
//  DefaultAppIconsService.swift
//  AppIcons
//
//  Created by Ross Butler on 19/12/2019.
//

import Foundation
import UIKit

class DefaultIconsService: IconsService {
    
    func icons(primaryIconName: String, primaryIconFileName: String?) -> Icons? {
        let bundle = Bundle.main
        let fileManager = FileManager.default
        guard isAvailable(),
            let icons = bundle.object(forInfoDictionaryKey: InfoPlistKeys.icons) as? [String: Any],
            let altIconEntries = icons[InfoPlistKeys.alternate] as? [String: [String: [String]]] else {
                return nil
        }
        let primaryIconFileName = resolvePrimaryIconFileName(primaryIconFileName)
        let primaryIcon = Icon(iconName: primaryIconName, fileName: primaryIconFileName, isPrimary: true)
        var altIcons: [Icon] = altIconEntries.compactMap { entry in
            let iconName = entry.key
            guard let fileName = entry.value[InfoPlistKeys.files]?.first else {
                return nil
            }
            return Icon(iconName: iconName, fileName: fileName)
        }
        altIcons = altIcons.filter { iconModel in
            guard let path = bundle.path(forResource: iconModel.fileName, ofType: "png") else {
                return false
            }
            return fileManager.fileExists(atPath: path)
        }.sorted(by: { (lhsIcon, rhsIcon) -> Bool in
            return lhsIcon.iconName < rhsIcon.iconName
        })
        return Icons(primaryIcon: primaryIcon, alternateIcons: altIcons)
    }
    
    /// Determines whether or not we may use alternate icons.
    func isAvailable() -> Bool {
        if #available(iOS 10.3, *) {
            return UIApplication.shared.supportsAlternateIcons
        } else {
            return false
        }
    }
    
    /// Resolves to the provided file name if non-nil, otherwise attempts to locate entry in app's info dictionary.
    func resolvePrimaryIconFileName(_ primaryIconFileName: String?) -> String? {
        guard let icons = Bundle.main.object(forInfoDictionaryKey: InfoPlistKeys.icons) as? [String: Any],
            let primaryIconDict = icons[InfoPlistKeys.primary] as? [String: Any],
            let primaryIcons = primaryIconDict[InfoPlistKeys.files] as? [String] else {
                return primaryIconFileName
        }
        return primaryIconFileName ?? primaryIcons.last
    }
    
    func setPreferredIcon(_ icon: Icon, completion: ((PreferredIconResult) -> Void)?) {
        let iconName: String? = (icon.isPrimary) ? nil : icon.iconName
        if #available(iOS 10.3, *) {
            UIApplication.shared.setAlternateIconName(iconName) { error in
                if let error = error {
                    completion?(.failure(error))
                } else {
                    completion?(.success(true))
                }
            }
        }
    }
    
}

