import SwiftUI

struct ContentView: View {
    @State var filteredItems = apps
    
    var body: some View {
        CustomNavigationView(
            view: AnyView(Home(filteredItems: $filteredItems)),
            placeHolder: "Search Apps or Games",
            largeTitle: true,
            title: "App Store",
            onSearch: { (txt) in
                // Filterting Data
                if txt != "" {
                    self.filteredItems = apps.filter { $0.name.lowercased().contains(txt.lowercased()) }
                } else {
                    self.filteredItems = apps
                }
            }, onCancel: {
                // Do Your Own Code When Search And Canceled
                self.filteredItems = apps
            })
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
