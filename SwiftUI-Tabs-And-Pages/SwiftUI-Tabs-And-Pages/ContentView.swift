import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("SwiftUI - Tabs and Pages")

                NavigationLink(destination: TabViewBasic()) {
                    Text("TabView Basic")
                }

                NavigationLink(destination: PagerView()) {
                    Text("Pager View")
                }
            }
            .navigationBarTitle("Tabs and Pages")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
