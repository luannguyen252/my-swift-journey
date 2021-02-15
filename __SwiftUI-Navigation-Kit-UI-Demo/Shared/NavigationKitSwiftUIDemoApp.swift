import SwiftUI

@main
struct NavigationKitSwiftUIDemoApp: App {
    @State var selection: Int = 2
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                ContentView()
                    .tabItem {
                        Image(systemName: "1.circle.fill")
                    }
                    .tag(1)
                
                ContentView()
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                    }
                    .tag(2)
            }
        }
    }
}
