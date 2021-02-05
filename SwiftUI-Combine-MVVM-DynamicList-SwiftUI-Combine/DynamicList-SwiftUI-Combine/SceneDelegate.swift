//
//  SceneDelegate.swift
//  DynamicList-SwiftUI-Combine
//
//  Created by Farooq Rasheed on 03/01/2020.
//  Copyright © 2020 Farooq Rasheed. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: SearchUserView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
