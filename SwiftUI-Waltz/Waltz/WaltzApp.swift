//
//  WaltzApp.swift
//  Waltz
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

@main
struct WaltzApp: App {
    // MARK: - PROPERTIES
    @StateObject var model: WaltzModel = WaltzModel()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onAppear {
                    UIApplication.shared.isIdleTimerDisabled = true
                }
                .onDisappear {
                    UIApplication.shared.isIdleTimerDisabled = false
                }
        }
    }
}
