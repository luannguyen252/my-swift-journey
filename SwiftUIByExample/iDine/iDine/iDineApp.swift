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
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(order)
        }
    }
}
