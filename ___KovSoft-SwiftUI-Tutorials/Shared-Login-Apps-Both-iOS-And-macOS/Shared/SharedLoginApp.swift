import SwiftUI

@main
struct SharedLoginApp: App {
    var body: some Scene {
        // Hiding title bar for only macOS
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

// Checking only for macOS and disabling focus ring
#if !os(iOS)
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
#endif
