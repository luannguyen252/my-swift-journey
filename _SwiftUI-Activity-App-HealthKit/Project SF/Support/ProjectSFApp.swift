import SwiftUI

struct ProjectSFApp: App {
    let cloudKitStore = CloudKitStore.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
