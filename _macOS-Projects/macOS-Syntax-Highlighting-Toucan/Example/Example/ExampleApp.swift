import Cocoa
import SwiftUI

var appDelegate = AppDelegate()

@main
struct AppUserInterfaceSelector {
    static func main() {
        if #available(OSX 11.0, *) {
            Example.main()
        } else {
            ExampleAppDelegate.main()
        }
    }
}

@available(OSX 11.0, *)
struct Example: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        }
    }
}

struct ExampleAppDelegate {
    static func main() {
        NSApplication.shared.setActivationPolicy(.regular)

        NSApp.delegate = appDelegate
        NSApp.activate(ignoringOtherApps: true)
        NSApp.run()
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 800, height: 300),
            styleMask: [.closable, .miniaturizable],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) { }
}
