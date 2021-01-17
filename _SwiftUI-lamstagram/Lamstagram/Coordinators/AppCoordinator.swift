//
//  AppCoordinator.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Swinject
import UIKit

final class AppCoordinator: TabBarControllerCoordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()

    let assembler = Assembler()
    
    let tabBarController: UITabBarController
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    init(tabBarController: UITabBarController = UITabBarController()) {
        self.tabBarController = tabBarController
        
        assembleDependencyInjectionContainer()
    }
    
    func start() {
        setupTabBarController()
    }
}

// MARK: - Setup

extension AppCoordinator {
    func setupTabBarController() {
        tabBarController.viewControllers = [
            makeFeedViewController(),
            makeProfileViewController()
        ]
    }
}

// MARK: - Assembly

extension AppCoordinator {
    func assembleDependencyInjectionContainer() {
        assembler.apply(
            assemblies: [
                ManagerAssembly(),
                ServiceAssembly(),
                ViewModelAssembly()
            ]
        )
    }
}

// MARK: - Factories

private extension AppCoordinator {
    func makeFeedViewController() -> UIViewController {
        let feedCoordinator = FeedCoordinator(
            parentCoordinator: self,
            assembler: assembler
        )
        
        childCoordinators.append(feedCoordinator)
        feedCoordinator.start()

        let viewController = feedCoordinator.rootViewController
        viewController.tabBarItem.image = UIImage(systemName: "house")
        viewController.tabBarItem.title = "Feed"
        
        return viewController
    }

    func makeProfileViewController() -> UIViewController {
        let profileCoordinator = ProfileCoordinator(
            parentCoordinator: self,
            assembler: assembler
        )
        
        childCoordinators.append(profileCoordinator)
        profileCoordinator.start()

        let viewController = profileCoordinator.rootViewController
        viewController.tabBarItem.image = UIImage(systemName: "person")
        viewController.tabBarItem.title = "Profile"
        
        return viewController
    }
}

// MARK: - Navigation

extension AppCoordinator {
    func showMessage(text: String) {
        let alert = UIAlertController(
            title: "Important message",
            message: text,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        tabBarController.present(alert, animated: true)
    }
}
