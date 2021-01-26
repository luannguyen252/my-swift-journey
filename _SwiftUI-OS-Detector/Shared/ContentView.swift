

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(iOS)
        iphoneNavView
        #else
        NavigationMacOS
        #endif
    }
}

var iphoneNavView: some View {
    TabView {
        ForEach(Menu) { m in
        Text(m.name)
            .tabItem {
                Image(systemName: m.icon)
                Text(m.name)
            }
        }
    }
    .navigationTitle("Test")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
