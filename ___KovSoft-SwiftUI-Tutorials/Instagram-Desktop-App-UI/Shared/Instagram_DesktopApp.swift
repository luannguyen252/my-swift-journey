//
//  Instagram_DesktopApp.swift
//  Shared
//
//  Created by Balaji on 23/12/20.
//

import SwiftUI

@main
struct Instagram_DesktopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding Focus Ring....

extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
