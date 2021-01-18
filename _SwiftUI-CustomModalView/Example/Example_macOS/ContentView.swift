import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
            .frame(width: 500, height: 300)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
