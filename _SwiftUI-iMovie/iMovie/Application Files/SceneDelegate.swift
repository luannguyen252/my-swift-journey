//
//  SceneDelegate.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        //MARK:-  UIkit
        window?.rootViewController = HomeTabBarController()
        window?.makeKeyAndVisible()
        
        //MARK:- SwiftUI
//        window?.rootViewController = UIHostingController(rootView: TabBarView())
//        window?.makeKeyAndVisible()
        
    }

}

