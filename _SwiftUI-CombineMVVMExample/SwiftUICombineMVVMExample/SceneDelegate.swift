//
//  SceneDelegate.swift
//  SwiftUICombineMVVMExample
//
//  Created by Toomas Vahter on 03.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let movieStore = MovieStore()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let viewModel = MovieListView.ViewModel(movieStore: movieStore)
        let contentView = MovieListView(viewModel: viewModel).environment(\.movieStore, movieStore)
        // Movie store in environment is later used for initialising AddMovieView.ViewModel
        
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
}
