import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            DesignOne()
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
