import SwiftUI

@main
struct SwiftUI2App: App {
    @AppStorage("counter") var counter = 0
    
    var body: some Scene {
        WindowGroup {
            ContentViewMultiple(counter:$counter)
        }
    }
}
