import SwiftUI

@main
struct PlaceholdersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(article: Article(title: "SwiftUI",
                                         body: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.",
                                         imageName: "graduationcap"))
        }
    }
}
