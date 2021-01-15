//
//  AppCoordinator.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

final class AppCoordinator {
    private let window: UIWindow
    private let rootViewController: UINavigationController
    
    private init(window: UIWindow, rootViewController: UINavigationController) {
        self.window = window
        self.rootViewController = rootViewController
    }
    
    private func showCheeseListViewController() {
        let cheeseListView = CheeseListView(viewModel: CheeseListViewModel(api: MockApi()))
        cheeseListView.viewModel.delegate = self
        rootViewController.setViewControllers([UIHostingController(rootView: cheeseListView)], animated: true)
    }
    
    static func startApplicationCoordinator(window: UIWindow) -> AppCoordinator {
        let applicationCoordinator = AppCoordinator(window: window, rootViewController: UINavigationController())
        applicationCoordinator.start()
        return applicationCoordinator
    }
}

extension AppCoordinator: CoordinatorProtocol {
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        showCheeseListViewController()
    }
}

extension AppCoordinator: CheeseListViewModelDelegate {
    func showDetail(cheese: Cheese) {
        print("Show detail of \(cheese)")
    }
}
