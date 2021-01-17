//
//  FeedCoordinator.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Swinject
import UIKit

final class FeedCoordinator: NavigationControllerCoordinator {
    var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()

    let assembler: Assembler
    
    var navigationController: UINavigationController
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    init(
        navigationController: UINavigationController = UINavigationController(),
        parentCoordinator: AppCoordinator?,
        assembler: Assembler
    ) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.assembler = assembler
    }
    
    func start() {
        setupNavigationController()
    }
}

// MARK: - Setup

extension FeedCoordinator {
    func setupNavigationController() {
        navigationController.pushViewController(
            makeFeedViewController(),
            animated: false
        )
    }
}

// MARK: - Factories

extension FeedCoordinator {
    func makeFeedViewController() -> UIViewController {
        let feedViewController = storyboard.instantiateViewController(
            identifier: "FeedViewController"
        ) { coder -> UIViewController? in
            let viewModel = self.resolve(FeedViewModel.self)
            let viewController = FeedViewController(
                coder: coder,
                viewModel: viewModel,
                coordinator: self
            )
            
            return viewController
        } as! FeedViewController
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
        feedViewController.tabBarItem.title = "Feed"
        
        return feedViewController
    }
}

// MARK: - Navigation

extension FeedCoordinator: PostDetailShowing {}

extension FeedCoordinator {
    func showHelloWorldMessage() {
        parentCoordinator?.showMessage(text: "Hello world!")
    }
}
