//
//  iDineApp.swift
//  iDine
//
//  Created by Luan Nguyen on 31/12/2020.
//

import SwiftUI

@main
struct iDineApp: App {
    // MARK: - PROPERTIES
    var order = Order()
    var favorites = Favorites()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(order)
                .environmentObject(favorites)
        }
    }
}
