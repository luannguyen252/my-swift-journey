//
//  SceneDelegate.swift
//  GymOrNotGym
//
//  Created by Michael on 10/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var coreData = CoreDataContainer.main

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		// Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
		// If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
		// This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

		// Get the managed object context from the shared persistent container.
		let context = coreData.persistentContainer.viewContext

		// Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
		// Add `@Environment(\.managedObjectContext)` in the views that will need the context.
		let contentView = ContentView().environment(\.managedObjectContext, context)
//		let contentView = ContentView(contentViewModel: ContentViewModel(context))
		
		let navigationView = NavigationView {
			contentView
		}

		// Use a UIHostingController as window root view controller.
		if let windowScene = scene as? UIWindowScene {
		    let window = UIWindow(windowScene: windowScene)
		    window.rootViewController = UIHostingController(rootView: navigationView)
		    self.window = window
		    window.makeKeyAndVisible()
		}
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		// Called as the scene transitions from the foreground to the background.
		// Use this method to save data, release shared resources, and store enough scene-specific state information
		// to restore the scene back to its current state.

		// Save changes in the application's managed object context when the application transitions to the background.
		coreData.saveContext()
	}

}

