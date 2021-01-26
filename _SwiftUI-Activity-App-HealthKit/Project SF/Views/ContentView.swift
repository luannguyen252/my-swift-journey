import SwiftUI

struct ContentView: View {
    @State var page = 1

    var body: some View {
        TabView(selection: $page) {
            CompetitionsView()
                .tag(1)

            TeamsView()
                .tag(2)

            SettingsView()
                .tag(3)
        }
        .accentColor(.init(red: 1, green: 0.4, blue: 0.4))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
