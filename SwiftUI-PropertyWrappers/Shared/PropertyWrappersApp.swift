//
//  PropertyWrappersApp.swift
//  Shared
//
//  Created by Master Family on 06/08/2020.
//

import SwiftUI

@available(OSX 11.0, *)
@main
struct PropertyWrappersApp: App {
    @StateObject var dataProvider = DataProvider()
    var body: some Scene {
        WindowGroup {
            EnvironmentUsingView()
                .environmentObject(dataProvider)
            
        }
    }
}
