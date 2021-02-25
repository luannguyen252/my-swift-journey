//
//  FB_MacApp.swift
//  Shared
//
//  Created by Balaji on 14/12/20.
//

import SwiftUI

@main
struct FB_MacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Hiding Window Title
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding Textfield Ring...

extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
