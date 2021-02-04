// https://twitter.com/StewartLynch/status/1354806140702400515
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI\nViewModifiers & Extensions")
                .font(.system(size: 40))
                .fontWeight(.heavy)
        }
        .embedNavigation(title: "Navigation Title")
    }
}

struct EmbedInNavigation: ViewModifier {
    var title: String
    var displayMode: NavigationBarItem.TitleDisplayMode
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(displayMode)
        }
    }
}

extension View {
    func embedNavigation(
        title: String,
        displayMode: NavigationBarItem.TitleDisplayMode = .automatic
    ) -> some View {
        self.modifier(EmbedInNavigation(title: title, displayMode: displayMode))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
