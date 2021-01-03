//
//  IndependentNavigationApp.swift
//  IndependentNavigation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

@main
struct IndependentNavigationApp: App {
    // MARK: - PROPERTIES
    @StateObject var viewRouter = ViewRouter()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: ViewRouter())
        }
    }
}
