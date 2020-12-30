//
//  SceneDelegate.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private var flowCoordinator: PlantListFlowCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let dependencyContainer = (UIApplication.shared.delegate as! AppDelegate).dependencyContainer
        flowCoordinator = PlantListFlowCoordinator(dependencyContainer: dependencyContainer)
        
        // TODO: Loading view
        dependencyContainer.loadDependencies {
            dependencyContainer.connectivityProvider.connect()
            
            let viewModel = self.flowCoordinator!.plantListViewModel
            
            // Triggering the add plant shortcut when launching the app
            if connectionOptions.shortcutItem?.type == UIApplicationShortcutItem.Action.addPlant.rawValue {
                viewModel.isPresentingAddPlant = true
            }
            let contentView = PlantListView(viewModel: viewModel).environmentObject(self.flowCoordinator!)
            
            guard let windowScene = scene as? UIWindowScene else { return }
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        flowCoordinator?.reloadShortcuts()
    }
    
    // MARK: Handling Shortcut Items
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        guard let identifier = UIApplicationShortcutItem.Action(rawValue: shortcutItem.type) else { fatalError("Unknown shortcut") }
        switch identifier {
        case .addPlant:
            flowCoordinator?.plantListViewModel.isPresentingAddPlant = true
        case .showPlant:
            print("show plant: \(String(describing: shortcutItem.userInfo))")
        }
        completionHandler(true)
    }
}

extension UIApplicationShortcutItem {
    enum Action: String {
        case addPlant
        case showPlant
    }
}
