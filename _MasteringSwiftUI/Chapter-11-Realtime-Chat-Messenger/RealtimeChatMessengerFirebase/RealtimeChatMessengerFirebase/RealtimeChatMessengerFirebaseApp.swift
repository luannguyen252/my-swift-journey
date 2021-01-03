//
//  RealtimeChatMessengerFirebaseApp.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

@main
struct RealtimeChatMessengerFirebaseApp: App {
    // MARK: - VIEW ROUTER
    @StateObject var viewRouter = ViewRouter(pageToStartWith: UserDefaults.standard.string(forKey: "username") != nil ? .chatView : .loginView)
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(viewRouter)
        }
    }
}
