//
//  SwiftUIPartialSheetApp.swift
//  SwiftUIPartialSheet
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import PartialSheet

@main
struct SwiftUIPartialSheetApp: App {
    let sheetManager: PartialSheetManager = PartialSheetManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
        }
    }
}
