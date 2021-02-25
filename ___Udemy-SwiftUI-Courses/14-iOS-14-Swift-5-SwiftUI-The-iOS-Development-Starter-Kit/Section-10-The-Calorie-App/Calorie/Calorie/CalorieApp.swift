//
//  CalorieApp.swift
//  Calorie
//
//  Created by Pao Yu on 2020-07-30.
//

import SwiftUI

@main
struct CalorieApp: App {
    
    @StateObject var model: CalorieModel = CalorieModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
