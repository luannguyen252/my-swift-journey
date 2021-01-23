import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: GCGirdContentView()) {
                    Text("GCGird Content View")
                }

                NavigationLink(destination: GCColorView()) {
                    Text("GCColor View")
                }
            }
            .navigationBarTitle("GCGird View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
