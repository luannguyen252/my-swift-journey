//
//  AppDelegate.swift
//  ColorConverter
//
//  Created by Benni on 24.09.19.
//  Copyright © 2019 Benni. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let contentView = ContentView()

		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.rootViewController = UIHostingController(rootView: contentView)
		self.window?.makeKeyAndVisible()

		return true
	}

}

