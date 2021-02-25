//
//  IndexApp.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

@main
struct IndexApp: App {
    
    @StateObject var model: IndexModel = IndexModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
