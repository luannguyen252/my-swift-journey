//
//  FocusApp.swift
//  Focus
//
//  Created by Pao Yu on 2020-07-15.
//

import SwiftUI

@main
struct FocusApp: App {
    
    @StateObject var model: FocusModel = FocusModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
