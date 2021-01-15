//
//  SwiftUIScrollApp.swift
//  SwiftUIScroll
//
//  Created by Gualtiero Frigerio on 24/08/2020.
//

import SwiftUI

@main
struct SwiftUIScrollApp: App {
    let contentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model:contentViewModel)
        }
    }
}
