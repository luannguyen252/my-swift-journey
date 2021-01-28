import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationWatchOS
    }
}

var NavigationWatchOS: some View {
    NavigationView {
        List(Menu) { m in
            NavigationLink(
                destination: Text(m.name)) {
                Label(m.name, systemImage: m.icon)
            }
        }
    }
    .navigationTitle("watchOS Navigation")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
