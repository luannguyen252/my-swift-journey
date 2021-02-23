//
//  jsonExampleApp.swift
//  jsonExample
//
//  Created by Arnav Motwani on 20/02/21.
//

import SwiftUI

@main
struct jsonExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(jsonData()) // Creating an instance of jsonData that we pass to the content view
        }
    }
}
