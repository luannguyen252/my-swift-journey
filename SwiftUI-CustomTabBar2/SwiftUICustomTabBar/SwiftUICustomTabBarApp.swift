//
//  SwiftUICustomTabBarApp.swift
//  SwiftUICustomTabBar
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

@main
struct SwiftUICustomTabBarApp: App {
    // MARK: - PROPERTIES
    @StateObject var viewRouter = ViewRouter()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
