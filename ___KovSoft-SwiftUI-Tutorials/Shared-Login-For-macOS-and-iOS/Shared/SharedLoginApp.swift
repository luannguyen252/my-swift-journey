//
//  SharedLoginApp.swift
//  Shared
//
//  Created by Balaji on 11/01/21.
//

import SwiftUI

@main
struct SharedLoginApp: App {
    var body: some Scene {
        // Hiding Title Bar For Only macOS...
        #if os(iOS)
        WindowGroup {
            ContentView()
        }
        #else
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}

// CHecking Only For MacOS And Disabling FOcus Ring....
#if !os(iOS)

extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
#endif
