//
//  AppIcons.swift
//  AppIcons
//
//  Created by Ross Butler on 19/12/2019.
//

import Foundation
import UIKit

public class AppIcons {
    
    public typealias Configuration = AppIconsConfiguration
    
    public static var configuration = Configuration()
    
    /// Returns whether or not alternate app icons are available for the current platform.
    public static var isAvailable: Bool {
        return Services.icons.isAvailable()
    }
    
    /// Returns icons if any are available for the current platform.
    public static var icons: Icons? {
        return Services.icons.icons(primaryIconName: configuration.primaryIconName, primaryIconFileName: configuration.primaryIconFileName)
    }
    
    /// Attempts to set the preferred app icon, returning an error if the event of failure or a `Bool` if successful.
    public static func setPreferredIcon(_ icon: Icon, completion: ((PreferredIconResult) -> Void)?) {
        Services.icons.setPreferredIcon(icon, completion: completion)
    }
    
    /// Returns a `UIViewController` allowing app icon selection.
    public static func viewController(configuration: Configuration? = nil, completion: ViewControllerCompletionDelegate? = nil) -> UIViewController {
        let factory = IconsViewControllerFactory(configuration: (configuration ?? self.configuration), completion: completion)
        return factory.manufacture()
    }
    
}
