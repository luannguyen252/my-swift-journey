//
//  TabBarControllerCoordinator.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

public protocol TabBarControllerCoordinator: Coordinator {
    var tabBarController: UITabBarController { get }
}

public extension TabBarControllerCoordinator {
    var rootViewController: UIViewController {
        return tabBarController
    }
}
