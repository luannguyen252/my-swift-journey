//
//  WaltzApp.swift
//  Waltz
//
//  Created by Pao Yu on 2020-08-04.
//

import SwiftUI

@main
struct WaltzApp: App {
    
    @StateObject var model: WaltzModel = WaltzModel()
    
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
