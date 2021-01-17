//
//  NavigationControllerCoordinator.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

public protocol NavigationControllerCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}

public extension NavigationControllerCoordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
}
