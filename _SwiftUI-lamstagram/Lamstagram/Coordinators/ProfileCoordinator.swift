//
//  ProfileCoordinator.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Swinject
import UIKit

final class ProfileCoordinator: NavigationControllerCoordinator {
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

extension ProfileCoordinator {
    func setupNavigationController() {
        navigationController.pushViewController(
            makeProfileViewController(userID: 1),
            animated: false
        )
    }
}

// MARK: - Factories

extension ProfileCoordinator {
    func makeProfileViewController(userID: Int) -> UIViewController {
        let profileViewController = storyboard.instantiateViewController(
            identifier: "ProfileViewController"
        ) { coder -> UIViewController? in
            let viewModel = self.resolve(ProfileViewModel.self)
            viewModel.userID = userID
            
            let viewController = ProfileViewController(coder: coder, viewModel: viewModel, coordinator: self)
            
            return viewController
        }
        
        return profileViewController
    }
}

// MARK: - Navigation

extension ProfileCoordinator: PostDetailShowing {}

extension ProfileCoordinator {
    func showUserProfile(user: User) {
        let profileViewController = makeProfileViewController(userID: user.id)
        
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
