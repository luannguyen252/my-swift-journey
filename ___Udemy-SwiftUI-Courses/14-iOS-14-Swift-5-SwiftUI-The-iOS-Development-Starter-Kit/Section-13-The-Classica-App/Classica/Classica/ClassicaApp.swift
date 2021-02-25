//
//  ClassicaApp.swift
//  Classica
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI

@main
struct ClassicaApp: App {
    
    @StateObject var model: ClassicaModel = ClassicaModel()
    
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
