import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overall")) {
                    OverallHeader()
                }
                Section(header: Text("States")) {
                    StateList()
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Loadability COVID-19")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
