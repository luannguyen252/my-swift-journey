import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(iOS)
        NavigationIOS
        #elseif os(macOS)
        NavigationMacOS
        #elseif os(watchOS)
        NavigationWatchOS
        #elseif os(tvOS)
        // NavigationTVOS
        #endif
    }
}

var NavigationIOS: some View {
    TabView {
        ForEach(Menu) { m in
        Text(m.name)
            .tabItem {
                Image(systemName: m.icon)
                Text(m.name)
            }
        }
    }
    .navigationTitle("iOS Navigation")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
