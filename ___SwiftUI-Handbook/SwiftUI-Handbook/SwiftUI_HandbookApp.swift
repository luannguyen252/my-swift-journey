import SwiftUI
import Firebase

@main
struct SwiftUI_HandbookApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
