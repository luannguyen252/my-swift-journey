import SwiftUI

@main
struct SwiftUIStateObjectApp: App {
    @State var dependencyContainer = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dependencyContainer)
        }
    }
}
