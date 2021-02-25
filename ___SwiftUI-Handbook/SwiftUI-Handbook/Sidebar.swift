import SwiftUI

struct Sidebar: View {
    var body: some View {
        // Sidebar
        NavigationView {
            List {
                NavigationLink(destination: HomeView()) {
                        Label("Courses", systemImage: "book")
                }
                Label("Tutorials", systemImage: "square")
            }
            .navigationTitle("Learn")
        }
    }
}

// Home View
struct HomeView: View {
    var body: some View {
        Text("Courses")
            .navigationTitle("Courses")
    }
}

#if DEBUG
struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
#endif
