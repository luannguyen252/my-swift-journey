//
//  IndependentNavigation_EnvironmentObjectApp.swift
//  IndependentNavigation-EnvironmentObject
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

@main
struct IndependentNavigation_EnvironmentObjectApp: App {
    // MARK: - PROPERTIES
    @StateObject var viewRouter = ViewRouter()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
