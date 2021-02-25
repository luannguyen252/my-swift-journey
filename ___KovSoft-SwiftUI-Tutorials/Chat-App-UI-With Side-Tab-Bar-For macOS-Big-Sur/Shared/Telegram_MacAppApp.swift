//
//  Telegram_MacAppApp.swift
//  Shared
//
//  Created by Balaji on 06/01/21.
//

import SwiftUI

@main
struct Telegram_MacAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Hiding Title Bar...
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding Textfield FOcus Ring....

extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        
        get{.none}
        set{}
    }
}
