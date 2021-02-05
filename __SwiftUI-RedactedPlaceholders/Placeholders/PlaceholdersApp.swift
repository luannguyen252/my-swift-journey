import SwiftUI

@main
struct PlaceholdersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(article: Article(title: "Mock article title",
                                         body: "This is a mock article body to display a nice placeholder while the real data is loading",
                                         imageName: "graduationcap"))
        }
    }
}
