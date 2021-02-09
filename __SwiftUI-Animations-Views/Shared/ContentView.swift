import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TemplateView()) {
                    Text("Template View")
                }
                NavigationLink(destination: ActivityLoader()) {
                    Text("Activity Loader")
                }
                NavigationLink(destination: PulseLoader()) {
                    Text("Pulse Loader")
                }
            }
            .navigationBarTitle("SwiftUI Views")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

