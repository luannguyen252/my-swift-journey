//
//  Login_MacApp.swift
//  Shared
//
//  Created by Balaji on 08/12/20.
//

import SwiftUI

@main
struct Login_MacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Hiding The Title Bar...
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding Textfield Focus Ring...
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
