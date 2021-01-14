//
//  SceneDelegate.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 08.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let viewModel = BoardViewModel(board: Board(columns: config.columns, rows: config.rows), tilesToWin: config.tilesToWin)

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: RootView().environmentObject(viewModel))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
