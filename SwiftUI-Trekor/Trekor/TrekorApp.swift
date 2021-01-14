

import SwiftUI

@main
struct TrekorApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView(location: Location.example)
            }
        }
    }
}
